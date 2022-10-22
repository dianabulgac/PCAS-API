Feature: json object

  Scenario: json reader parser

    * def jsonObject =
    """
    [
    {
    "name" : "Tom",
    "city" : "Bangok",
    "age" : 25
    },
    {
    "name" : "Tomas",
    "city" : "Baltimore",
    "age" : 45
}
]
    """
    * print jsonObject
    * print jsonObject[0]
    * print jsonObject[1].name + jsonObject[1]

    Scenario: complex json object
      * def jsonObject =
      """
    {
    "glossary": {
    "title": "example glossary",
    "GlossDiv": {
    "title": "S",
    "GlossList": {
    "GlossEntry": {
    "ID": "SGML",
    "SortAs": "SGML",
    "GlossTerm": "Standard Generalized Markup Language",
    "Acronym": "SGML",
    "Abbrev": "ISO 8879:1986",
    "GlossDef": {
    "para": "A meta-markup language, used to create markup languages such as DocBook.",
    "GlossSeeAlso": ["GML", "XML"]
    },
    "GlossSee": "markup"
    }
    }
    }
    }
    }
"""
      * print jsonObject
      * print jsonObject.glossary