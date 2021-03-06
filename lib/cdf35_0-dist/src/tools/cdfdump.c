/******************************************************************************
* Copyright 1996-2013 United States Government as represented by the
* Administrator of the National Aeronautics and Space Administration.
* All Rights Reserved.
******************************************************************************/
/******************************************************************************
*
*  NSSDC/CDF                 CDFdump - dump data contents in a CDF file.
*
*  Version 1.0, 9-Jul-06, Raytheon.
*
*  Modification history:
*
*   V1.0  09-Jul-06, M Liu      Original version.
*   V3.3  10-Jan-09, M Liu      Validate a file before it is used.
*   V3.5  10-Sep-13, M Liu      Added "-col2row" option.
*
******************************************************************************/

#define CDFDUMP
#include "cdfdump.h"

/******************************************************************************
* Increased stack size for Borland C on IBM PC.
******************************************************************************/

#if defined(BORLANDC)
extern unsigned _stklen = BORLANDC_STACK_SIZE;
#endif

/******************************************************************************
* Global variables.
******************************************************************************/

/******************************************************************************
* Main.
******************************************************************************/

#if !defined(win32) || (defined(win32) && defined(ALONE))
MAIN {
  Logical success = TRUE;
  strcpyX (pgmName, "CDFdump", MAX_PROGRAM_NAME_LEN);
  success = DumpCDF (argc, argv);
#if defined(DEBUG)
  if (cdf_FreeMemory(NULL,FatalError) > 0) DisplayWarning ("Abandoned buffers.");
#else
  cdf_FreeMemory (NULL, FatalError);
#endif
  return BOO(success,EXIT_SUCCESS_,EXIT_FAILURE_);
}
#endif

/******************************************************************************
* DumpCDF.
******************************************************************************/

Logical DumpCDF (argC, argV)
int argC;
char *argV[];
{

CDFid id;
CDFstatus status;
long numDims, dimSizes[CDF_MAX_DIMS], dimIntervals[CDF_MAX_DIMS], 
     dimIndices[CDF_MAX_DIMS], dimCounts[CDF_MAX_DIMS];
long version, release, increment, format, majority, encoding, numrVars,
     numzVars, numAttrs, numgAttrs, numvAttrs, numgEntries, numrEntries, 
     numzEntries, checksum;
long dataType, numElems, scope, recVary, dataTypeX, numElemsX;
long dimVarys[CDF_MAX_DIMS];
long compression, compressParms[CDF_MAX_DIMS], cPct;
long numRecs, numAllocRecs, maxRec, sp, bf, maxAllocRec;
long nHypers, hyperN, nValuesPerRec, nLogValuesPerRec, 
     nValuesPerDim[CDF_MAX_DIMS], nValues;
char CDFpath[CDF_PATHNAME_LEN+1], outputFile[CDF_PATHNAME_LEN+1];
char CDFname[DU_MAX_NAME_LEN+1], dir[DU_MAX_DIR_LEN+1];
char varName[CDF_VAR_NAME_LEN256+1], attrName[CDF_ATTR_NAME_LEN256+1];
char copyRight[CDF_COPYRIGHT_LEN+1];
char oDir[DU_MAX_DIR_LEN+1], oName[DU_MAX_NAME_LEN+1];
char tText[256];
char shortStr1[20], shortStr2[20], *prtFormat;
void *value, *working;
void *value2 = NULL;
Logical  toCol2Row = FALSE;
Byte1 **handles[1], *buffer;
char **vars;
int  numVars = 0;
size_t nValueBytes[1];
size_t offset, nBytes;
struct HyperStruct hyperX;
struct GroupStruct groups;
Logical Z, pad, ifound;
int  varNum, i, ii, j, k, ir, imore, iskip, icount, ij, precision;
long tmpLong[1] = {0};
Logical qopError = FALSE;
FILE *fp;
QOP *qop;
static char *validQuals[] = {
  "dump", "output", "format", "noformat", "significant", "vars", "about",
  "header", "noheader", "recordrange", "col2row", NULL 
};
static int optRequired[] = {
  TRUE, TRUE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE,
  0
};
int numValidDumps = 5;
static char *validDumps[] = {
  "all", "data", "metadata", "global", "variable" };


/******************************************************************************
* Parse qualifiers/options/parameters (QOP).
******************************************************************************/

switch (argC) {
  case 1:
    PageOLH ("cdfdump.olh", argV[0]);
    return TRUE;
  case 2:
    if (strcmp(argV[1],"-java") == 0) {
      pagingOn = FALSE;
      PageOLH ("cdfdumpj.olh", argV[0]);
      return TRUE;
    }
  default:
    qop = Qop (argC, argV, validQuals, optRequired);
    if (qop == NULL) return FALSE;
    /************************************************************************
    * Check for the `dump' qualifier.
    ************************************************************************/
    if (qop->qualEntered[DUMPqual]) {
      strcpyX (dumpOption, qop->qualOpt[DUMPqual], 20);
      Z = FALSE;
      for (i = 0; i < numValidDumps; i++) {
        if (strcmpIgCase(validDumps[i], dumpOption) == 1) {
          dump = i;
          Z = TRUE;
          break;
        }
      }
      if (!Z) {
        DisplayError ("Invalid dump option.");
        qopError = TRUE;
        return TRUE;
      }
    } else
      MakeNUL(dumpOption);
    /************************************************************************
    * Check for the `format' qualifier.
    ************************************************************************/
    qopError = qopError |! TFqualifier(qop,&useFormat,FORMATqual,NOFORMATqual,
                                       DEFAULTformatDUMP, "format");
    /**************************************************************************
    * Check for `about' qualifier.
    **************************************************************************/
    if (qop->qualEntered[ABOUTqual]) {
      DisplayIdentification (pgmName);
      cdf_FreeMemory (qop, FatalError);
      return TRUE;
    }
    /**************************************************************************
    * Check for `precision' qualifier.
    **************************************************************************/
    if (qop->qualEntered[PRECISIONqual]) {
      if (sscanf(qop->qualOpt[PRECISIONqual],"%d,",&precision) != 1) {
        DisplayError ("Invalid precision option.");
        qopError = TRUE;
      } else {
        if (precision < 1) {
          DisplayError ("Invalid precision option.");
          qopError = TRUE;
        }
      }
    } else
      precision = 0;
    /**************************************************************************
    * Check for `header' qualifier.
    **************************************************************************/
    qopError = qopError |! TFqualifier(qop,&header,HEADERqual,NOHEADERqual,
                                       DEFAULTheaderDUMP, "header");
    /**************************************************************************
    * Check for `col2row' qualifier.
    **************************************************************************/
    if (qop->qualEntered[COL2ROWqual]) {
      col2row = TRUE;
    }
    /************************************************************************
    * Check for `output' qualifier.
    ************************************************************************/
    if (qop->qualEntered[OUTPUTqual]) {
      if (!ValidateQual(qop->qualOpt[OUTPUTqual], validQuals))
        strcpyX (outputFile, qop->qualOpt[OUTPUTqual], CDF_PATHNAME_LEN);
      else {
        DisplayError ("Invalid output option.");
        qopError = TRUE;
      }
    } else
      MakeNUL(outputFile);
    /************************************************************************
    * Check for `vars' qualifier.
    ************************************************************************/
    if (qop->qualEntered[VARSqual]) {
      strcpyX (varsOption, qop->qualOpt[VARSqual], 512);
      numVars = GetNumTokens (',', varsOption);
      if (numVars > 0) {
        vars = (char **) cdf_AllocateMemory ((size_t)sizeof(char *) * numVars,
                                             FatalError);
        for (i = 0; i < numVars; i++) 
          vars[i] = (char *) cdf_AllocateMemory ((size_t)CDF_VAR_NAME_LEN256+1, 
                                                 FatalError);
        ParseStringForTokens (',', varsOption, vars);
      }   
    } else
      MakeNUL(varsOption);
    /*********************************************************************
    * Check for `recordrange' qualifier.
    *********************************************************************/
    if (qop->qualEntered[RECORDRANGEqual]) {
      if (!ParseRecordRange(qop->qualOpt[RECORDRANGEqual],
                            &startingRec,&endingRec)) {
        DisplayError ("Illegal record range.");
        qopError = TRUE;
      }
    }
    else {
      startingRec = useDEFAULTrecordNUM;
      endingRec = useDEFAULTrecordNUM;
    }
    /**************************************************************************
    * Get CDF pathname.
    **************************************************************************/
    if (qop->Nparms < 1) {
      DisplayError ("Missing parameter.");
      qopError = TRUE;
    }
    else { 
      strcpyX (CDFpath, qop->parms[CDFPATHparm], DU_MAX_PATH_LEN);
      ParsePath (CDFpath, dir, CDFname);
    }

    if (!NULstring(outputFile)) {
      if (strncmpIgCase(outputFile, "source", 6) != 0) {
        int loc;
        char mytmp[CDF_PATHNAME_LEN+1];
        strcpyX (mytmp, CDFpath, CDF_PATHNAME_LEN);
        loc = StrlaststrIgCase(mytmp, ".cdf");
        if (loc == -1) strcatX (EofS(mytmp), ".txt", 0);
        else strcpyX (mytmp+loc, ".txt", 0);
        strcpyX (outputFile, mytmp, 0);
      } else {
        ParsePath (outputFile, oDir, oName);
        if (strchr(oName,'.') == NULL) 
          strcatX (outputFile, ".txt", DU_MAX_PATH_LEN);
      }
    }
    if (!strcmp(outputFile, CDFpath)) {
      DisplayError ("Output file name is identical to source CDF file.");
      qopError = TRUE;
    }
    /**************************************************************************
    * Free QOP memory and check for an error.
    **************************************************************************/
    cdf_FreeMemory (qop, FatalError);
    if (qopError) return FALSE;
    break;
}

  /****************************************************************************
  * Display information.
  ****************************************************************************/
  if (header) {
    WriteOut (stdout, "Dumping cdf from \"");
    WriteOut (stdout, CDFpath);
    if (!EndsWithIgCase(CDFpath, ".cdf"))
      WriteOut (stdout, ".cdf");
    if (!NULstring(outputFile)) { 
      WriteOut (stdout, "\"  to  \"");
      WriteOut (stdout, outputFile);
    }
    WriteOut (stdout, "\"...\n");
  }

  CDFsetValidate (VALIDATEFILEon);
  /****************************************************************************
  * Open/inquire CDF.
  ****************************************************************************/

  status = CDFlib (OPEN_, CDF_, CDFpath, &id,
                   NULL_);
  if (status < CDF_OK) QuitCDF ("1.0", status, CDFpath);

  status = CDFlib (SELECT_, CDF_, id,
                            CDF_READONLY_MODE_, READONLYon,
                   GET_, CDF_VERSION_, &version,
                         CDF_RELEASE_, &release,
                         CDF_INCREMENT_, &increment,
                         CDF_FORMAT_, &format,
                         CDF_MAJORITY_, &majority,
                         CDF_ENCODING_, &encoding,
                         CDF_COMPRESSION_, &compression, compressParms, &cPct,
                         CDF_NUMrVARS_, &numrVars,
                         CDF_NUMzVARS_, &numzVars,
                         CDF_NUMATTRS_, &numAttrs,
                         CDF_NUMgATTRS_, &numgAttrs,
                         CDF_NUMvATTRS_, &numvAttrs,
                         CDF_COPYRIGHT_, copyRight,
                         CDF_CHECKSUM_, &checksum,
                   NULL_);
  if (status < CDF_OK) QuitCDF ("2.0", status, CDFpath);

  fp = BOO(!NULstring(outputFile),FOPEN(outputFile,"w"),stdout);

  /**********************************/
  /* Print out the file information */
  /**********************************/
  fprintf (fp, "File Info\n=========================================\n");
  fprintf (fp, "CDF File:     %s\n",CDFname);
  fprintf (fp, "Version:      %ld.%ld.%ld\n",version,release,increment);
  fprintf (fp, "Copyright:    %s\n",copyRight);
  if (dump == ALLDUMP) {
    fprintf (fp, "Format:       %s\n",FormatToken(format));
    fprintf (fp, "Encoding:     %s\n",EncodingToken(encoding));
    fprintf (fp, "Majority:     %s\n",MajorityToken(majority));
    fprintf (fp, "NumrVars:     %ld\n",numrVars);
    fprintf (fp, "NumzVars:     %ld\n",numzVars);
    fprintf (fp, "NumAttrs:     %ld (%ld global, %ld variable)\n", numAttrs, 
                                                                   numgAttrs,
                                                                   numvAttrs);
    fprintf (fp, "Compression:  %s\n",CompressionToken(compression, 
                                                       compressParms));
    if (!PriorTo ("3.2.0", (Int32) version, (Int32) release, (Int32) increment)) 
      fprintf (fp, "Checksum:     %s\n", ChecksumToken(checksum));
  }

  /**********************************************/
  /* Print out the Global Attribute information */
  /**********************************************/

  if (dump != DATADUMP && dump != VARIABLEDUMP) {
    if (numgAttrs > 0) {
      if (numgAttrs > 1)
        fprintf (fp, "\nGlobal Attributes (%ld attributes)\n",numgAttrs);
      else
        fprintf (fp, "\nGlobal Attribute (%ld attribute)\n",numgAttrs);
      fprintf (fp, "=========================================\n");

      j = 0;
      for (i = 0; i < (int) numAttrs; i++) {
        status = CDFlib (SELECT_, ATTR_, (long) i,
                         GET_, ATTR_SCOPE_, &scope,
                         NULL_);
        if (status < CDF_OK) QuitCDF ("3.0", status, NULL);

        if (scope != GLOBAL_SCOPE) continue;

        status = CDFlib (GET_, ATTR_NAME_, attrName,
                               ATTR_NUMgENTRIES_, &numgEntries,
                         NULL_);
        if (status < CDF_OK) QuitCDF ("4.0", status, attrName);

        if (numgEntries <= 1)
          fprintf (fp, "%s (%ld entry):\n", attrName, numgEntries);
        else
          fprintf (fp, "%s (%ld entries):\n", attrName, numgEntries);

        j = k = 0;
        if (numgEntries > 0) {
          do {
            status = CDFlib (SELECT_, gENTRY_, (long) j,
                             GET_, gENTRY_DATATYPE_, &dataTypeX,
                                   gENTRY_NUMELEMS_, &numElemsX,
                             NULL_);
            if (status < CDF_OK) {
              j++;
              continue;
            } else {
              if (STRINGdataType(dataTypeX)) imore = 1;
              else imore = 0;
              nBytes = (size_t) (CDFelemSize(dataTypeX) * (numElemsX + imore));
              value = cdf_AllocateMemory ((size_t) nBytes, FatalError);
              status = CDFlib (GET_, gENTRY_DATA_, value,
                               NULL_);
              if (status < CDF_OK) QuitCDF ("5.0", status, attrName);
              fprintf (fp, "\t%d (CDF_%s/%ld): \t",
                           j,DataTypeToken(dataTypeX),numElemsX);
              if (STRINGdataType(dataTypeX)) {
                ((char *)value)[numElemsX] = '\0';
                fprintf (fp, "\"%s\"\n", (char *)value);
              } else {
                int ix, style;
                char tmp[256];
                if (TT2000dataType(dataTypeX)) style = TT2000_3_STYLE;
                else style = EPOCH0_STYLE;
                for (ix = 0; ix < numElemsX; ++ix) {
                  EncodeValue (dataTypeX, (char *)value+ix*CDFelemSize(dataTypeX),
                               tmp, style, (size_t) sizeof(tmp));
                  if (ix == 0) strcpyX (tText, tmp, 0);
                  else strcatX (tText, tmp, 255);
                  if (numElemsX > 1 && ix < (numElemsX-1))
                    strcatX (tText, " ", 255);
                }
                fprintf (fp, "%s\n", tText);
              }
              k++;
              j++;
              cdf_FreeMemory (value, FatalError);
            }
          } while (k < numgEntries);
        }
      }
    }
  }
  
  if (dump == GLOBALDUMP) {
    status = CDFlib (CLOSE_, CDF_,
                     NULL_);
    exit(1);
  }

  if (dump != DATADUMP) {
    if (numvAttrs > 0) {
      if (numvAttrs > 1)
        fprintf (fp, "\nVariable Attributes (%ld attributes)\n",numvAttrs);
      else
        fprintf (fp, "\nVariable Attribute (%ld attribute)\n",numvAttrs);
      fprintf (fp, "=========================================\n");

      for (i = 0; i < (int) numAttrs; i++) {
        status = CDFlib (SELECT_, ATTR_, (long) i,
                         GET_, ATTR_SCOPE_, &scope,
                         NULL_);
        if (status < CDF_OK) QuitCDF ("6.0", status, NULL);

        if (scope == GLOBAL_SCOPE) continue;

        status = CDFlib (GET_, ATTR_NAME_, attrName,
                               ATTR_NUMrENTRIES_, &numrEntries,
                               ATTR_NUMzENTRIES_, &numzEntries,
                         NULL_);
        if (status < CDF_OK) QuitCDF ("7.0", status, attrName);

        fprintf (fp, "%s\n", attrName);
      }
    }
  }

  /**************************************/
  /* Print out the Variable information */ 
  /**************************************/

  fprintf (fp, "\nVariable Information ");
  if (numVars == 0) {
    if (numrVars <= 1) fprintf (fp, "(%ld rVariable, ", numrVars);
    else fprintf (fp, "%ld rVariables, ", numrVars);
    if (numzVars <= 1) fprintf (fp, "(%ld zVariable)\n", numzVars);
    else fprintf (fp, "%ld zVariables)\n", numzVars); 
  } else
    printf("\n");

  fprintf (fp, "===========================================================\n");

  if (numrVars > 0) {
    status = CDFlib (GET_, rVARs_NUMDIMS_, &numDims,
                           rVARs_DIMSIZES_, dimSizes,
                     NULL_);
    if (status < CDF_OK) QuitCDF ("8.0", status, NULL);

    for (i = 0; i < numrVars; i++) {
       status = CDFlib (SELECT_, rVAR_, (long) i,
                        GET_, rVAR_NAME_, varName,
                              rVAR_DATATYPE_, &dataType,
                              rVAR_NUMELEMS_, &numElems,
                              rVAR_DIMVARYS_, dimVarys,
                              rVAR_RECVARY_, &recVary,
                        
                        NULL_);
      if (status < CDF_OK) QuitCDF ("9.0", status, varName);

      if (numVars > 0) {
        ifound = FALSE;
        for (ii = 0; ii < numVars; ii++) {
           if (!strcmp(varName, vars[ii])) {
             ifound = TRUE;
             break;
           }
        }
        if (!ifound) continue;
      }

      fprintf (fp, "%s", varName);
      j = (int) strlen(varName);
      if (j < 22) Ncharacters (fp, (22-j), ' ');
      else fprintf (fp, "%s", " ");

      if (numDims == 0)
        fprintf (fp, "CDF_%s/%ld\t0:[]\t%s/  ", 
                 DataTypeToken(dataType), numElems, BOO(recVary,"T","F"));
      else if (numDims == 1)
        fprintf (fp, "CDF_%s/%ld\t%ld:[%ld]\t%s/%s", 
                 DataTypeToken(dataType), numElems, numDims, dimSizes[0], 
                 BOO(recVary,"T","F"), BOO(dimVarys[0],"T","F"));
      else {
        for (j = 0; j < numDims; j++) {
          if (j == 0) {
            snprintf (shortStr1, (size_t) sizeof(shortStr1),
		      "%ld", dimSizes[j]);
            snprintf (shortStr2, (size_t) sizeof(shortStr2), 
		      "%s", BOO(dimVarys[j],"T","F"));
          } else {
            strcat(shortStr1, ",");
            snprintf (EofS(shortStr1),
		      (size_t) sizeof(shortStr1)-strlen(shortStr1), "%ld", 
		      dimSizes[j]);
            snprintf (EofS(shortStr2),
		      (size_t) sizeof(shortStr2)-strlen(shortStr2), "%s", 
		      BOO(dimVarys[j],"T","F"));
          }
        }
        fprintf (fp, "CDF_%s/%ld\t%ld:[%s]\t%s/%s", 
                 DataTypeToken(dataType), numElems, numDims, shortStr1,
                 BOO(recVary,"T","F"), shortStr2);
      }
      fprintf (fp, "\n");
    }
  }

  if (numzVars > 0) {
    for (i = 0; i < numzVars; i++) {
       status = CDFlib (SELECT_, zVAR_, (long) i,
                        GET_, zVAR_NAME_, varName,
                              zVAR_DATATYPE_, &dataType,
                              zVAR_NUMELEMS_, &numElems,
                              zVAR_NUMDIMS_, &numDims,
                              zVAR_DIMSIZES_, dimSizes,
                              zVAR_DIMVARYS_, dimVarys,
                              zVAR_RECVARY_, &recVary,
                        NULL_);
      if (status < CDF_OK) QuitCDF ("10.0", status, varName);

      if (numVars > 0) {
        ifound = FALSE;
        for (ii = 0; ii < numVars; ii++) {
           if (!strcmp(varName, vars[ii])) {
             ifound = TRUE;
             break;
           }
        }
        if (!ifound) continue;
      }

      fprintf (fp, "%s", varName);
      j = (int) strlen(varName);
      if (j < 22) Ncharacters (fp, (22-j), ' ');
      else fprintf (fp, "%s", " ");

      if (numDims == 0)
        fprintf (fp, "CDF_%s/%ld\t0:[]\t%s/  ", 
                 DataTypeToken(dataType), numElems, BOO(recVary,"T","F"));
      else if (numDims == 1)
        fprintf (fp, "CDF_%s/%ld\t%ld:[%ld]\t%s/%s", 
                 DataTypeToken(dataType), numElems, numDims, dimSizes[0],
                 BOO(recVary,"T","F"), BOO(dimVarys[0],"T","F"));
      else {
        for (j = 0; j < numDims; j++) {
          if (j == 0) {
            snprintf (shortStr1, (size_t) sizeof(shortStr1), "%ld",
		      dimSizes[j]);
            snprintf (shortStr2, (size_t) sizeof(shortStr2), "%s",
		      BOO(dimVarys[j],"T","F"));
          } else {
            strcat(shortStr1, ",");
            snprintf (EofS(shortStr1),
		      (size_t) sizeof(shortStr1)-strlen(shortStr1), "%ld", 
		      dimSizes[j]);
            snprintf (EofS(shortStr2),
		      (size_t) sizeof(shortStr2)-strlen(shortStr2), "%s", 
		      BOO(dimVarys[j],"T","F"));
          }
        }
        fprintf (fp, "CDF_%s/%ld\t%ld:[%s]\t%s/%s", 
                 DataTypeToken(dataType), numElems, numDims, shortStr1,
                 BOO(recVary,"T","F"), shortStr2);
      }
      fprintf (fp, "\n");
    }
  }

  /**********************************************************/
  /* Print out the Variable data.                           */ 
  /**********************************************************/
  if (numVars == 0) {
    if ((numrVars+numzVars) > 1)
      fprintf (fp, "\n\nVariable (%ld variables)\n", (numrVars+numzVars));
    else
      fprintf (fp, "\n\nVariable (%ld variable)\n", (numrVars+numzVars));
    fprintf (fp, "=========================================\n\n");
  } else
    fprintf (fp, "\n\n");
  
  for (varNum = 0; varNum < (int) (numrVars+numzVars); varNum++) {
    if (varNum < (int) numrVars) Z = FALSE;
    else Z = TRUE;
    ii = varNum;
    if (ii >= (int) numrVars) ii = ii - (int) numrVars;
    status = CDFlib (SELECT_, BOO(Z,zVAR_,rVAR_), (long) ii,
                     GET_, BOO(Z,zVAR_NAME_,rVAR_NAME_), varName,
                     NULL_);
    if (status < CDF_OK) QuitCDF ("11.0", status, varName);
        
    if (numVars > 0) {
      ifound = FALSE;
      for (ij = 0; ij < numVars; ij++) {
         if (!strcmp(varName, vars[ij])) {
           ifound = TRUE;
           break;
         } 
      } 
      if (!ifound) continue;
    }

    fprintf (fp, "%s\n", varName);
    Ncharacters (fp, (int) strlen(varName), '-');
    fprintf (fp, "\n");

    if (useFormat) {
      status = GetFormatEntry (Z, (long) ii, &prtFormat);
    } else
      prtFormat = NULL;

    status = CDFlib (SELECT_, BOO(Z,zVAR_,rVAR_), (long) ii,
                     GET_, BOO(Z,zVAR_DATATYPE_,rVAR_DATATYPE_), &dataType,
                           BOO(Z,zVAR_NUMELEMS_,rVAR_NUMELEMS_), &numElems,
                           BOO(Z,zVAR_NUMDIMS_,rVARs_NUMDIMS_), &numDims,
                           BOO(Z,zVAR_DIMSIZES_,rVARs_DIMSIZES_), dimSizes,
                           BOO(Z,zVAR_DIMVARYS_,rVAR_DIMVARYS_), dimVarys,
                           BOO(Z,zVAR_RECVARY_,rVAR_RECVARY_), &recVary,
                           BOO(Z,zVAR_NUMRECS_,rVAR_NUMRECS_), &numRecs,
                           BOO(Z,zVAR_MAXREC_,rVAR_MAXREC_), &maxRec,
                           BOO(Z,zVAR_MAXallocREC_,rVAR_MAXallocREC_), 
                           &maxAllocRec,
                           BOO(Z,zVAR_NUMallocRECS_,rVAR_NUMallocRECS_), 
                           &numAllocRecs,
                           BOO(Z,zVAR_COMPRESSION_,rVAR_COMPRESSION_), 
                           &compression, compressParms, &cPct,
                           BOO(Z,zVAR_BLOCKINGFACTOR_,rVAR_BLOCKINGFACTOR_), 
                           &bf,
                           BOO(Z,zVAR_SPARSERECORDS_,rVAR_SPARSERECORDS_), 
                           &sp,
                     NULL_);
    if (status < CDF_OK) QuitCDF ("12.0", status, varName);

    if (dump != METADATADUMP && dump != VARIABLEDUMP) {
      if (STRINGdataType(dataType)) imore = 1;
      else imore = 0;
      nBytes = (size_t) (CDFelemSize(dataType) * (numElems + imore));
      value = cdf_AllocateMemory ((size_t) nBytes, FatalError);
      status = CDFlib (GET_, BOO(Z,zVAR_PADVALUE_,rVAR_PADVALUE_), value,
                       NULL_);
      if (status != NO_PADVALUE_SPECIFIED) {
        pad = TRUE;
        if (STRINGdataType(dataType)) {
          ((char *)value)[numElems] = '\0';
          strcpyX (tText, value, numElems);
        } else {
          int style;
          if (TT2000dataType(dataType)) style = TT2000_3_STYLE;
          else style = EPOCH0_STYLE;
          EncodeValue (dataType, value, tText, style, (size_t) sizeof(tText));
        }
      } else
        pad = FALSE;
      cdf_FreeMemory (value, FatalError);
      fprintf (fp, "Data Type:           CDF_%s", DataTypeToken(dataType));
      if (STRINGdataType(dataType)) 
        fprintf (fp, "/%ld\n", numElems);
      else
        fprintf (fp, "\n");
      fprintf (fp, "Dimensionality:      ");
      if (numDims == 0)
        fprintf (fp, "0:[]\t(%s/)  ", BOO(recVary,"T","F"));
      else if (numDims == 1)
        fprintf (fp, "%ld:[%ld]\t(%s/%s)", numDims, dimSizes[0], 
                 BOO(recVary,"T","F"), BOO(dimVarys[0],"T","F"));
      else {
        for (j = 0; j < numDims; j++) {
          if (j == 0) {
            snprintf (shortStr1, (size_t) sizeof(shortStr1), "%ld",
		      dimSizes[j]);
            snprintf (shortStr2, (size_t) sizeof(shortStr2), "%s",
		      BOO(dimVarys[j],"T","F"));
          } else {
            strcat(shortStr1, ",");
            snprintf (EofS(shortStr1),
		      (size_t) sizeof(shortStr1)-strlen(shortStr1), "%ld", 
		      dimSizes[j]);
            snprintf (EofS(shortStr2),
		      (size_t) sizeof(shortStr2)-strlen(shortStr2), "%s", 
		      BOO(dimVarys[j],"T","F"));
          }
        }
        fprintf (fp, "%ld:[%s]\t(%s/%s)", numDims, shortStr1,
                 BOO(recVary,"T","F"), shortStr2);
      }
      fprintf (fp, "\n");

      if (!ROWmajor(majority) && col2row && numDims > 1) toCol2Row = TRUE;
      else toCol2Row = FALSE;
      if (useFormat && prtFormat != NULL)
        fprintf (fp, "Format:              %s\n", prtFormat);
      if (dump != DATADUMP)
        if (compression != NO_COMPRESSION) {
          fprintf (fp, "Compression:         %s\n", 
                       CompressionToken(compression, compressParms));
        }
      /* if (pad) { */
        if (STRINGdataType(dataType)) {
          char delimiter;
          if (strchr(tText, '"') == NULL) delimiter = '"';
          else if (strchr(tText, '\'') == NULL) delimiter = '\'';
          else delimiter = '%';
          fprintf (fp, "Pad value:           %c", delimiter);
          fprintf (fp, "%s", tText);
          fprintf (fp, "%c\n", delimiter);
        } else 
          fprintf (fp, "Pad value:           %s\n", tText);
      /* } */
      fprintf (fp, "Written Records:     %ld/%ld(max)\n", numRecs, (maxRec+1));
      if (dump != DATADUMP) {
        fprintf (fp, "Allocated Records:   %ld/%ld(max)\n", numAllocRecs, 
                                                        (maxAllocRec+1));
        fprintf (fp, "Blocking Factor:     %ld (records)\n", bf);
      }
      if (sp != NO_SPARSERECORDS)
        fprintf (fp, "Sparseness:          %s\n", 
                     SparsenessToken(sp, 0L, tmpLong));
    }

    if (dump != DATADUMP) {
      if (numvAttrs > 0) {
        if (dump != VARIABLEDUMP)
          fprintf (fp, "Attribute Entries:\n");
        for (ij = 0; ij < (int) numAttrs; ij++) {
          status = CDFlib (SELECT_, ATTR_, (long) ij,
                           GET_, ATTR_SCOPE_, &scope,
                           NULL_);
          if (status < CDF_OK) QuitCDF ("14.0", status, NULL);

          if (scope == GLOBAL_SCOPE) continue;

          status = CDFlib (SELECT_, BOO(Z,zENTRY_,rENTRY_), (long) ii,
                           GET_, BOO(Z,zENTRY_DATATYPE_,rENTRY_DATATYPE_), 
                                 &dataTypeX,
                                 BOO(Z,zENTRY_NUMELEMS_,rENTRY_NUMELEMS_), 
                                 &numElemsX,
                           NULL_);
          if (status < CDF_OK) continue;

          if (STRINGdataType(dataTypeX)) imore = 1;
          else imore = 0;
          nBytes = (size_t) (CDFelemSize(dataTypeX) * (numElemsX + imore));
          value = cdf_AllocateMemory ((size_t) nBytes, FatalError);
          status = CDFlib (GET_, ATTR_NAME_, attrName,
                                 BOO(Z,zENTRY_DATA_,rENTRY_DATA_), value,
                           NULL_);
          if (status < CDF_OK) QuitCDF ("15.0", status, attrName);
 
          fprintf (fp, "     %s", attrName);
          ir = (int) strlen(attrName);
          if (ir < 16) Ncharacters (fp, (16-ir), ' ');
          else fprintf (fp, "%s", " ");

          fprintf (fp, "(CDF_%s/%ld): ",
                       DataTypeToken(dataTypeX),numElemsX);
          if (STRINGdataType(dataTypeX)) {
            ((char *)value)[numElemsX] = '\0';
            fprintf (fp, "\"%s\"\n", (char *)value);
          } else {
            int style;
            if (TT2000dataType(dataTypeX)) style = TT2000_3_STYLE;
            else style = EPOCH0_STYLE;
            if (numElemsX > 1) {
              int ip;
              int ix = CDFelemSize(dataTypeX);
              for (ip = 0; ip < numElemsX; ++ip) {
                EncodeValue (dataTypeX, ((char *) value)+ix*ip, tText, style,
                             (size_t) sizeof(tText));
                fprintf (fp, "%s", tText);
                if (ip != (numElemsX -1)) fprintf (fp, ", ");
              }
              fprintf (fp, "\n");
            } else {
              if (strcmpIgCase(attrName,"fillval") == 1 ||
                  strcmpIgCase(attrName,"validmin") == 1 ||
                  strcmpIgCase(attrName,"validmax") == 1) {
                if (dataType == dataTypeX || (dataType == CDF_EPOCH ||
                                              dataType == CDF_EPOCH16 ||
                                              dataType == CDF_TIME_TT2000))
                  EncodeValue (dataType, value, tText, style,
                               (size_t) sizeof(tText));
                else
                  EncodeValue (dataTypeX, value, tText, style,
                               (size_t) sizeof(tText));
              } else
                EncodeValue (dataTypeX, value, tText, style,
                             (size_t) sizeof(tText));
              fprintf (fp, "%s\n", tText);
            }
          }
          cdf_FreeMemory (value, FatalError);
        }
      }
    } 

    if (dump != METADATADUMP && dump != VARIABLEDUMP) {
      fprintf (fp, "Variable Data:\n");
      for (i = 0, nValuesPerRec = 1, nLogValuesPerRec = 1; i < numDims; i++) {
        if (dimVarys[i]) nValuesPerRec *= dimSizes[i];
        nLogValuesPerRec *= dimSizes[i];
      }
      iskip = (int) nLogValuesPerRec / nValuesPerRec;

      for (i = 0; i < numDims; i++) {
        nValuesPerDim[i] = 1;
        if (ROWmajor(majority)) {
          for (j = i + 1; j < numDims; j++) 
              nValuesPerDim[i] *= dimSizes[j];
        } else {
          for (j = i - 1; j >= 0; j--) 
            nValuesPerDim[i] *= dimSizes[j];
        }
      }
      nValueBytes[0] = (size_t) numElems * CDFelemSize(dataType);

      if (sp == NO_SPARSERECORDS) {
        long toRecs, ist, ien;
        ist = startingRec - 1;
        ien = endingRec - 1;
        handles[0] = &buffer;
        if (ist != -1 && ist > maxRec) {
          fprintf (fp, "\n");
          continue;
        }
        if (ien != -1 && ien > maxRec) ien = maxRec;
        if (ist == -1) 
          toRecs = maxRec + 1;
        else
          toRecs = (ien == -1 ? maxRec : ien) - ist + 1;
        AllocateBuffers (toRecs, numDims, dimSizes, &groups, 0, 1, handles,
                         nValueBytes, ROWmajor(majority), 5, FatalError);
        InitHyperParmsFromAnywhere (&hyperX, &groups, numDims, &nHypers, 
                                    &nValues, (ist == -1 ? 0 : ist));
        if (STRINGdataType(dataType)) imore = 1;
        else imore = 0;
        nBytes = (size_t) (CDFelemSize(dataType) * (numElems + imore));
        working = cdf_AllocateMemory ((size_t) nBytes, FatalError);
        if (toCol2Row) value2 = malloc((size_t)nLogValuesPerRec*nValueBytes[0]);
        for (hyperN = 0; hyperN < nHypers; hyperN++) {
          for (j = 0; j < numDims; ++j)
            if (!dimVarys[j]) hyperX.dimCounts[j] = 1;
          status = HYPER_READ (id, Z, hyperX, buffer);
          if (status < CDF_OK) QuitCDF("16.0", status, varName);
          offset = 0;
          for (k = 0, value = buffer; k < nValues;
               k += iskip, offset += (size_t) nValueBytes[0]) {
            i = hyperX.recNumber + k / nLogValuesPerRec; 
            j = k - k / nLogValuesPerRec * nLogValuesPerRec;
            if (j == 0) {
              icount = 0; 
              fprintf (fp, "  Record # %d: ",(i+1));
              if (nValuesPerRec > 1) fprintf (fp, "%s", "[");
              if (toCol2Row) {
                COLtoROW((char *)value+offset, (char *) value2, numDims,
                          dimSizes, nValueBytes[0]);
                memcpy ((char *)value+offset, (char *)value2,
                        (size_t)nLogValuesPerRec*nValueBytes[0]); 
              }
            }
            memcpy (working, (char *) value+offset, nBytes);
            if (STRINGdataType(dataType)) {
              ((char *)working)[numElems] = '\0';
              fprintf (fp, "\"%s\"", (char *)working);
            } else {
              int style;
              if (TT2000dataType(dataType)) style = TT2000_3_STYLE;
              else style = EPOCH0_STYLE;
              if (prtFormat != NULL) {
		if ((dataType == CDF_FLOAT) || (dataType == CDF_REAL4)) {
                  if (!isnan((double)*(float *)working) &&
                      *(float *)working <= DEFAULT_FLOAT_PADVALUE) {
                    EncodeValueFormat (dataType, working, tText, NULL, 0, 0,
                                       style, (size_t) sizeof(tText));
                  } else
                    EncodeValueFormat (dataType, working, tText, prtFormat,
                                       0, 0, style, (size_t) sizeof(tText));

		} else if ((dataType == CDF_DOUBLE) || (dataType == CDF_REAL8)) {
                  if (!isnan(*(double *)working) &&
                      *(double *)working <= DEFAULT_DOUBLE_PADVALUE) {
                    EncodeValueFormat (dataType, working, tText, NULL, 0, 0,
                                       style, (size_t) sizeof(tText));
                  } else
                    EncodeValueFormat (dataType, working, tText, prtFormat, 
                                       0, 0, style, (size_t) sizeof(tText));

		} else
                  EncodeValueFormat (dataType, working, tText, prtFormat, 0, 0,
                                     style, (size_t) sizeof(tText));
              } else {
                  if (useFormat && (precision > 0) && 
                      (dataType == CDF_FLOAT || dataType == CDF_REAL4 ||
                       dataType == CDF_DOUBLE || dataType == CDF_REAL8)) {
                    char newFormat[20+1];
                    snprintf (newFormat, 20, "%%.%dg", precision);
                    EncodeValueFormat (dataType, working, tText, newFormat, 0,
                                       0, style, (size_t) sizeof(tText));
                  } else
		    EncodeValue (dataType, working, tText, style,
		 	         (size_t) sizeof(tText));
              }
              fprintf (fp, "%s", tText);
            }
            if (nValuesPerRec == 1) {
              fprintf (fp, "\n");
              continue;
            }
            icount++;
            if (icount == nValuesPerRec) fprintf (fp, "]\n");
            else fprintf (fp, ",");
            if (toCol2Row && (icount == nValuesPerRec)) free (value2);
          }
          IncrHyperParms (&hyperX, &groups, numDims, ROWmajor(majority),
                          &nValues);
        }
      } else {
        buffer = cdf_AllocateMemory ((size_t) nLogValuesPerRec * 
                                     nValueBytes[0], FatalError);
        if (STRINGdataType(dataType)) imore = 1;
        else imore = 0;
        nBytes = (size_t) (CDFelemSize(dataType) * (numElems + imore));
        working = cdf_AllocateMemory ((size_t) nBytes, FatalError);

        for (k = 0; k < numDims; k++) {
          dimIndices[k] = 0L;
          dimIntervals[k] = 1L;
          if (dimVarys[k]) dimCounts[k] = dimSizes[k];
          else dimCounts[k] = 1;
        }
        status = CDFlib(SELECT_, BOO(Z,zVAR_RECCOUNT_,rVARs_RECCOUNT_), 1L,
                                 BOO(Z,zVAR_RECINTERVAL_,rVARs_RECINTERVAL_), 
                                 1L,
                                 BOO(Z,zVAR_DIMINDICES_,rVARs_DIMINDICES_), 
                                 dimIndices,
                                 BOO(Z,zVAR_DIMINTERVALS_,rVARs_DIMINTERVALS_), 
                                 dimIntervals,
                                 BOO(Z,zVAR_DIMCOUNTS_,rVARs_DIMCOUNTS_), 
                                 dimCounts,
                        NULL_);
        if (status < CDF_OK) QuitCDF("17.0", status, varName);
        if (toCol2Row) value2 = malloc((size_t)nLogValuesPerRec*nValueBytes[0]);
        for (k = 0; k < (int) (maxRec+1); k++) {
          status = CDFlib(SELECT_, BOO(Z,zVAR_RECNUMBER_,rVARs_RECNUMBER_), 
                                   (long) k,
                          GET_, BOO(Z,zVAR_HYPERDATA_,rVAR_HYPERDATA_), buffer,
                          NULL_);
/*          if (status == VIRTUAL_RECORD_DATA) continue; */
          if (status < CDF_OK) QuitCDF("18.0", status, varName);
          offset = 0;
          for (ir = 0, value = buffer; ir < nLogValuesPerRec;
               ir += iskip, offset += (size_t) nValueBytes[0]) {
            if (ir == 0) {
              icount = 0;
              fprintf (fp, "  Record # %d: ",(k+1));
              if (nValuesPerRec > 1) fprintf (fp, "%s", "[");
              if (toCol2Row) {
                COLtoROW(buffer, value2, numDims, dimSizes,
                         nValueBytes[0]);
                memcpy ((char *)buffer, (char *)value2,
                        (size_t)nLogValuesPerRec*nValueBytes[0]);
              }
            } 
            memcpy (working, (char *)value+offset, nBytes);
      
            if (STRINGdataType(dataType)) {
                ((char *)working)[numElems] = '\0';
              fprintf (fp, "\"%s\"", (char *)working);
            } else {
              int style;
              if (TT2000dataType(dataType)) style = TT2000_3_STYLE;
              else style = EPOCH0_STYLE;
              if (prtFormat != NULL) {
                if ((dataType == CDF_FLOAT) || (dataType == CDF_REAL4)) {
                  if (!isnan((double)*(float *)working) &&
                      *(float *)working <= DEFAULT_FLOAT_PADVALUE) {
                    EncodeValueFormat (dataType, working, tText, NULL, 0, 0,
                                       style, (size_t) sizeof(tText));
                  } else
                    EncodeValueFormat (dataType, working, tText, prtFormat,
                                       0, 0, style, (size_t) sizeof(tText));
                } else if ((dataType == CDF_DOUBLE) || (dataType == CDF_REAL8)) {
                  if (!isnan(*(double *)working) &&
                      *(double *)working <= DEFAULT_DOUBLE_PADVALUE) {
                    EncodeValueFormat (dataType, working, tText, NULL, 0, 0,
                                       style, (size_t) sizeof(tText));
                  } else
                    EncodeValueFormat (dataType, working, tText, prtFormat,
                                       0, 0, style, (size_t) sizeof(tText));
                } else
                  EncodeValueFormat (dataType, working, tText, prtFormat, 0, 0,
                                     style, (size_t) sizeof(tText));
              } else {
                  if (useFormat && (precision > 0) && 
                      (dataType == CDF_FLOAT || dataType == CDF_REAL4 ||
                       dataType == CDF_DOUBLE || dataType == CDF_REAL8)) {
                    char newFormat[20+1];
                    snprintf (newFormat, 20, "%%.%dg", precision);
                    EncodeValueFormat (dataType, working, tText, newFormat, 0,
                                       0, style, (size_t) sizeof(tText));
                  } else
		    EncodeValue (dataType, working, tText, style,
			         (size_t) sizeof(tText));
              }
              fprintf (fp, "%s", tText);
            }
            if (nValuesPerRec == 1) {
              if (status == VIRTUAL_RECORD_DATA) fprintf (fp, "\t\t<== Virtual");
              fprintf (fp, "\n");
              continue;
            }
            icount++;
            if (icount == nValuesPerRec) {
	      fprintf (fp, "]");
	      if (status == VIRTUAL_RECORD_DATA) fprintf (fp, "\t\t<== Virtual");
              fprintf (fp, "\n");
            } else fprintf (fp, ",");
          }
        }
        if (toCol2Row) free (value2);
      } 
      fprintf (fp, "\n");
      cdf_FreeMemory (buffer, FatalError);
      cdf_FreeMemory (working, FatalError);
    } else
      fprintf (fp, "\n");
    if (prtFormat != NULL) cdf_FreeMemory (prtFormat, FatalError);
  }

  status = CDFlib (CLOSE_, CDF_, 
                   NULL_);

  if (fp != stdout) fclose(fp);

  if (numVars > 0) {
    for (k = 0; k < numVars; ++k) 
       cdf_FreeMemory (vars[k], FatalError);
  }

  exit(1);

}

/******************************************************************************
* QuitCDF.
******************************************************************************/

void QuitCDF (where, status, msg)
char *where;
CDFstatus status;
char *msg;
{
  char text[CDF_STATUSTEXT_LEN+1];
  printf ("Program failed at %s...\n", where);
  if (status < CDF_OK) {
    CDFlib (SELECT_, CDF_STATUS_, status,
            GET_, STATUS_TEXT_, text,
            NULL_);
    printf ("%s ", text);
    if (msg != NULL) printf ("(%s)\n", msg);
    else printf("\n");
  }
  CDFlib (CLOSE_, CDF_,
          NULL_);
  printf ("\n");
  exit (EXIT_FAILURE_);
}

