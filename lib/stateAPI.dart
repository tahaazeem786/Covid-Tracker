// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:covidtracker/screen/homescreen.dart';

//Individual Countries
var uaeAPI = Uri.parse('https://corona-api.com/countries/AE');
var usAPI = Uri.parse('https://corona-api.com/countries/US');
var pkAPI = Uri.parse('https://corona-api.com/countries/PK');
var cnAPI = Uri.parse('https://corona-api.com/countries/CN');
var saAPI = Uri.parse('https://corona-api.com/countries/SA');
var ukAPI = Uri.parse('https://corona-api.com/countries/GB');

//US State APIs
var alAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/AL.json?apiKey=399047455efe400fa2c9594eb038eaba');
var akAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/AK.json?apiKey=399047455efe400fa2c9594eb038eaba');
var azAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/AZ.json?apiKey=399047455efe400fa2c9594eb038eaba');
var arAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/AR.json?apiKey=399047455efe400fa2c9594eb038eaba');
var caAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/CA.json?apiKey=399047455efe400fa2c9594eb038eaba');
var coAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/CO.json?apiKey=399047455efe400fa2c9594eb038eaba');
var ctAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/CT.json?apiKey=399047455efe400fa2c9594eb038eaba');
var deAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/DE.json?apiKey=399047455efe400fa2c9594eb038eaba');
var dcAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/DC.json?apiKey=399047455efe400fa2c9594eb038eaba');
var flAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/FL.json?apiKey=399047455efe400fa2c9594eb038eaba');
var gaAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/GA.json?apiKey=399047455efe400fa2c9594eb038eaba');
var hiAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/HI.json?apiKey=399047455efe400fa2c9594eb038eaba');
var idAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/ID.json?apiKey=399047455efe400fa2c9594eb038eaba');
var ilAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/IL.json?apiKey=399047455efe400fa2c9594eb038eaba');
var inAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/IN.json?apiKey=399047455efe400fa2c9594eb038eaba');
var iaAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/IA.json?apiKey=399047455efe400fa2c9594eb038eaba');
var ksAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/KS.json?apiKey=399047455efe400fa2c9594eb038eaba');
var kyAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/KY.json?apiKey=399047455efe400fa2c9594eb038eaba');
var laAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/LA.json?apiKey=399047455efe400fa2c9594eb038eaba');
var meAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/ME.json?apiKey=399047455efe400fa2c9594eb038eaba');
var mdAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/MD.json?apiKey=399047455efe400fa2c9594eb038eaba');
var maAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/MA.json?apiKey=399047455efe400fa2c9594eb038eaba');
var miAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/MI.json?apiKey=399047455efe400fa2c9594eb038eaba');
var mnAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/MN.json?apiKey=399047455efe400fa2c9594eb038eaba');
var msAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/MS.json?apiKey=399047455efe400fa2c9594eb038eaba');
var moAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/MO.json?apiKey=399047455efe400fa2c9594eb038eaba');
var mtAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/MT.json?apiKey=399047455efe400fa2c9594eb038eaba');
var neAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/NE.json?apiKey=399047455efe400fa2c9594eb038eaba');
var nvAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/NV.json?apiKey=399047455efe400fa2c9594eb038eaba');
var nhAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/NH.json?apiKey=399047455efe400fa2c9594eb038eaba');
var njAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/NJ.json?apiKey=399047455efe400fa2c9594eb038eaba');
var nmAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/NM.json?apiKey=399047455efe400fa2c9594eb038eaba');
var nyAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/NY.json?apiKey=399047455efe400fa2c9594eb038eaba');
var ncAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/NC.json?apiKey=399047455efe400fa2c9594eb038eaba');
var ndAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/ND.json?apiKey=399047455efe400fa2c9594eb038eaba');
var ohAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/OH.json?apiKey=399047455efe400fa2c9594eb038eaba');
var orAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/OR.json?apiKey=399047455efe400fa2c9594eb038eaba');
var okAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/OK.json?apiKey=399047455efe400fa2c9594eb038eaba');
var paAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/PA.json?apiKey=399047455efe400fa2c9594eb038eaba');
var riAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/RI.json?apiKey=399047455efe400fa2c9594eb038eaba');
var scAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/SC.json?apiKey=399047455efe400fa2c9594eb038eaba');
var sdAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/SD.json?apiKey=399047455efe400fa2c9594eb038eaba');
var tnAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/TN.json?apiKey=399047455efe400fa2c9594eb038eaba');
var txAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/TX.json?apiKey=399047455efe400fa2c9594eb038eaba');
var utAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/UT.json?apiKey=399047455efe400fa2c9594eb038eaba');
var vtAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/VT.json?apiKey=399047455efe400fa2c9594eb038eaba');
var vaAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/VA.json?apiKey=399047455efe400fa2c9594eb038eaba');
var waAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/WA.json?apiKey=399047455efe400fa2c9594eb038eaba');
var wvAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/WV.json?apiKey=399047455efe400fa2c9594eb038eaba');
var wiAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/WI.json?apiKey=399047455efe400fa2c9594eb038eaba');
var wyAPI = Uri.parse(
    'https://api.covidactnow.org/v2/state/WY.json?apiKey=399047455efe400fa2c9594eb038eaba');

var listState = {
  'IL',
  'NC',
  'AL',
  'AK',
  'AZ',
  'AR',
  'CA',
  'CO',
  'CT',
  'DE',
  'DC',
  'FL',
  'GA',
  'HI',
  'ID',
  'IN',
  'IA',
  'KS',
  'KY',
  'LA',
  'ME',
  'MD',
  'MA',
  'MI',
  'MN',
  'MS',
  'MO',
  'MT',
  'NE',
  'NV',
  'NJ',
  'NM',
  'NY',
  'ND',
  'OH',
  'OK',
  'OR',
  'PA',
  'RI',
  'SC',
  'SD',
  'TN',
  'TX',
  'UT',
  'VT',
  'VA',
  'WA',
  'WV',
  'WI',
  'WY'
};

updateState(String? newState) {
  if (newState == 'IL')
    currentStateAPI = ilAPI;
  else if (newState == 'NC')
    currentStateAPI = ncAPI;
  else if (newState == 'AL')
    currentStateAPI = alAPI;
  else if (newState == 'AK')
    currentStateAPI = akAPI;
  else if (newState == 'AZ')
    currentStateAPI = azAPI;
  else if (newState == 'AR')
    currentStateAPI = arAPI;
  else if (newState == 'CA')
    currentStateAPI = caAPI;
  else if (newState == 'CO')
    currentStateAPI = coAPI;
  else if (newState == 'CT')
    currentStateAPI = ctAPI;
  else if (newState == 'DE')
    currentStateAPI = deAPI;
  else if (newState == 'DC')
    currentStateAPI = dcAPI;
  else if (newState == 'FL')
    currentStateAPI = flAPI;
  else if (newState == 'GA')
    currentStateAPI = gaAPI;
  else if (newState == 'HI')
    currentStateAPI = hiAPI;
  else if (newState == 'ID')
    currentStateAPI = idAPI;
  else if (newState == 'IN')
    currentStateAPI = inAPI;
  else if (newState == 'IA')
    currentStateAPI = iaAPI;
  else if (newState == 'KS')
    currentStateAPI = ksAPI;
  else if (newState == 'KY')
    currentStateAPI = kyAPI;
  else if (newState == 'LA')
    currentStateAPI = laAPI;
  else if (newState == 'ME')
    currentStateAPI = meAPI;
  else if (newState == 'MD')
    currentStateAPI = mdAPI;
  else if (newState == 'MA')
    currentStateAPI = maAPI;
  else if (newState == 'MI')
    currentStateAPI = miAPI;
  else if (newState == 'MN')
    currentStateAPI = mnAPI;
  else if (newState == 'MS')
    currentStateAPI = msAPI;
  else if (newState == 'MO')
    currentStateAPI = moAPI;
  else if (newState == 'MT')
    currentStateAPI = mtAPI;
  else if (newState == 'NE')
    currentStateAPI = neAPI;
  else if (newState == 'NV')
    currentStateAPI = nvAPI;
  else if (newState == 'NH')
    currentStateAPI = nhAPI;
  else if (newState == 'NJ')
    currentStateAPI = njAPI;
  else if (newState == 'NM')
    currentStateAPI = nmAPI;
  else if (newState == 'NY')
    currentStateAPI = nyAPI;
  else if (newState == 'ND')
    currentStateAPI = ndAPI;
  else if (newState == 'OH')
    currentStateAPI = ohAPI;
  else if (newState == 'OK')
    currentStateAPI = okAPI;
  else if (newState == 'OR')
    currentStateAPI = orAPI;
  else if (newState == 'PA')
    currentStateAPI = paAPI;
  else if (newState == 'RI')
    currentStateAPI = riAPI;
  else if (newState == 'SC')
    currentStateAPI = scAPI;
  else if (newState == 'SD')
    currentStateAPI = sdAPI;
  else if (newState == 'TN')
    currentStateAPI = tnAPI;
  else if (newState == 'TX')
    currentStateAPI = txAPI;
  else if (newState == 'UT')
    currentStateAPI = utAPI;
  else if (newState == 'VT')
    currentStateAPI = vtAPI;
  else if (newState == 'VA')
    currentStateAPI = vaAPI;
  else if (newState == 'WA')
    currentStateAPI = waAPI;
  else if (newState == 'WV')
    currentStateAPI = wvAPI;
  else if (newState == 'WI')
    currentStateAPI = wiAPI;
  else if (newState == 'WY') currentStateAPI = wyAPI;
}
