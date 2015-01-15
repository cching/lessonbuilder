function createSpreadsheetEditTrigger() {
  var ss = DocumentApp.openById('1RSjJjIDzXHOLtkOwinK776lfxG4pGVp1Qc_fZN7rPxI');
  ScriptApp.newTrigger('myFunction')
      .forDocument(ss)
      .onOpen()
      .create();
}

function myFunction() {
        var file = DocumentApp.getFileById('1RSjJjIDzXHOLtkOwinK776lfxG4pGVp1Qc_fZN7rPxI');
        var body = doc.getBody();
  var rowsData = [['Plants', 'Animals'], ['Ficus', 'Goat'], ['Basil', 'Cat'], ['Moss', 'Frog']];
  body.insertParagraph(0, doc.getName())
      .setHeading(DocumentApp.ParagraphHeading.HEADING1);
  table = body.appendTable(rowsData);
  table.getRow(0).editAsText().setBold(true);
      }

