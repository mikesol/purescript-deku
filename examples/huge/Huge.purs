-- @inline Data.Filterable.filterableArray(..).partitionMap always
-- @inline Data.List.fromFoldable always
-- @inline Deku.Core.resolveNut always
-- @inline Deku.Control.switcher always
-- @inline Deku.Core.dynify always
-- @inline Deku.Core.dyn always
-- @inline Deku.Control.foldlArray always
-- @inline Deku.Control.foldlArray2 always
-- @inline Deku.Control.elementify3 always
-- @inline Deku.Toplevel.runInBody always
-- @inline Deku.Toplevel.runInBody' always
-- @inline Deku.Toplevel.runInElement' always
-- @inline Deku.Control.deku always
-- @inline Deku.Control.filterMapArray always
-- @inline Deku.Control.filterArray always
-- @inline Deku.Control.compactArray always
-- @inline Deku.Control.amassKoroks always
-- @inline Deku.Control.actualizeNuts always
-- @inline Deku.Control.nutsToHtml always
-- @inline Deku.Control.unzipArray always
module Deku.Example.Huge where

import Prelude

import Deku.Attribute ((!:=))
import Deku.Attributes (klass_, klass)
import Deku.Control (text_, (<#~>))
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (create)

main1 :: Effect Unit
main1 =
  runInBody do
    D.div_
      [ D.div [ D.Id !:= "toggle" ]
          [ D.span_
              [ D.button
                  [ D.Id !:= "toggleButton" ]
                  [ text_ "Toggle" ]
              , text_ " Toggle sakura.css on/off"
              ]
          , D.br_ []
          , D.span [ D.Id !:= "switch" ]
              [ D.button
                  [ D.Id !:= "switchThemeButton"
                  ]
                  [ text_ "Switch" ]
              , text_ "Current theme: "
              , D.span [ D.Id !:= "currentTheme" ] [ text_ "sakura (default)" ]
              ]
          ]
      , D.div [ D.Id !:= "top" ]
          [ D.h1_ [ text_ "Sakura demo (h1 header)" ]
          , D.p_
              [ text_ "This is an anchor tag/hyper link: "
              , D.a [ D.Href !:= "https://github.com/oxalorg/sakura" ]
                  [ text_ "sakura - Github Repository" ]
              ]
          , D.p_
              [ text_
                  "Paragraphs look like this. Font size along with line height and maximum width are optimized for reading."
              ]
          , D.p_
              [ D.em_ [ text_ "Italic" ]
              , text_ ", "
              , D.strong_ [ text_ "bold" ]
              , text_ ", and "
              , D.code_ [ text_ "monospace" ]
              , text_ ". Itemized lists look like:"
              ]
          , D.ul_
              [ D.li_ [ text_ "this one" ]
              , D.li_ [ text_ "that one" ]
              , D.li_ [ text_ "the other one" ]
              ]
          , D.p_ [ D.strong_ [ text_ "Here's a block quote" ], text_ ":" ]
          , D.blockquote_
              [ D.p_
                  [ text_
                      "Man surprised me most about humanity. Because he sacrifices his health in order to make money. Then he sacrifices money to recuperate his health. And then he is so anxious about the future that he does not enjoy the present; the result being that he does not live in the present or the future; he lives as if he is never going to die, and then dies having never really lived. -James J Lachard"
                  ]
              ]
          , D.h2 [ D.Id !:= "an-h2-header" ] [ text_ "An h2 header" ]
          , D.p_ [ D.strong_ [ text_ "Some code blocks" ] ]
          , D.pre_
              [ D.code_
                  [ text_
                      "define foobar() {\n    print \"Welcome to flavor country!\";\n}"
                  ]
              ]
          , D.div [ D.Class !:= "sourceCode" ]
              [ D.pre [ D.Class !:= "sourceCode python" ]
                  [ D.code [ D.Class !:= "sourceCode python" ]
                      [ D.span [ D.Class !:= "im" ] [ text_ "import" ]
                      , text_ " time\n"
                      , D.span [ D.Class !:= "co" ]
                          [ text_ "# Quick, count to ten!" ]
                      , D.span [ D.Class !:= "cf" ] [ text_ "for" ]
                      , text_ " i "
                      , D.span [ D.Class !:= "op" ] [ text_ "in" ]
                      , D.span [ D.Class !:= "bu" ] [ text_ "range" ]
                      , text_ "("
                      , D.span [ D.Class !:= "dv" ] [ text_ "10" ]
                      , text_ "):\n    "
                      , D.span [ D.Class !:= "co" ]
                          [ text_ "# (but not *too* quick)" ]
                      , text_ "\n    time.sleep("
                      , D.span [ D.Class !:= "fl" ] [ text_ "0.5" ]
                      , text_ ")\n    "
                      , D.span [ D.Class !:= "bu" ] [ text_ "print" ]
                      , text_ " i"
                      ]
                  ]
              ]
          , D.h3 [ D.Id !:= "an-h3-header" ] [ text_ "An h3 header" ]
          , D.p_ [ text_ "A nested list:" ]
          , D.ol [ D.Style !:= "list-style-type: decimal" ]
              [ D.li_
                  [ D.p_ [ text_ "First, get these ingredients:" ]
                  , D.ul_
                      [ D.li_ [ text_ "carrots" ]
                      , D.li_ [ text_ "celery" ]
                      , D.li_ [ text_ "lentils" ]
                      ]
                  ]
              , D.li_ [ D.p_ [ text_ "Boil some water." ] ]
              , D.li_
                  [ D.p_
                      [ text_
                          "Dump everything in the pot and follow this algorithm:"
                      ]
                  , D.pre_
                      [ D.code_
                          [ text_
                              "find wooden spoon\nuncover pot\nstir\ncover pot\nbalance wooden spoon precariously on pot handle\nwait 10 minutes\ngoto first step (or shut off burner when done)"
                          ]
                      ]
                  , D.p_ [ text_ "Do not bump wooden spoon or it will fall." ]
                  ]
              ]
          , D.h1 [ D.Id !:= "header-level-1" ] [ text_ "Header level 1" ]
          , D.h2 [ D.Id !:= "header-level-2" ] [ text_ "Header level 2" ]
          , D.h3 [ D.Id !:= "header-level-3" ] [ text_ "Header level 3" ]
          , D.h4 [ D.Id !:= "header-level-4" ] [ text_ "Header level 4" ]
          , D.h5 [ D.Id !:= "header-level-5" ] [ text_ "Header level 5" ]
          , D.h6 [ D.Id !:= "header-level-6" ] [ text_ "Header level 6" ]
          , D.p_ [ text_ "A horizontal line:" ]
          , D.hr_ []
          , D.p_
              [ text_ "Here's a link to "
              , D.a [ D.Href !:= "http://foo.bar" ] [ text_ "a website" ]
              , text_ ", to a "
              , D.a [ D.Href !:= "local-doc.html" ] [ text_ "local doc" ]
              , text_ ", and to a "
              , D.a [ D.Href !:= "#an-h2-header" ]
                  [ text_ "section heading in the current doc" ]
              , text_ ". Here's a footnote "
              , D.a [ D.Href !:= "#fn1", D.Id !:= "fnref1" ]
                  [ D.sup_ [ text_ "1" ] ]
              , text_ "."
              ]
          , D.p_ [ text_ "Tables can look like this:" ]
          , D.table_
              [ D.caption_
                  [ text_
                      "\n      Shoes, their sizes, and what they're made of\n    "
                  ]
              , D.thead_
                  [ D.tr_
                      [ D.th [ D.Align !:= "left" ] [ text_ "size" ]
                      , D.th [ D.Align !:= "left" ] [ text_ "material" ]
                      , D.th [ D.Align !:= "left" ] [ text_ "color" ]
                      ]
                  ]
              , D.tbody_
                  [ D.tr_
                      [ D.td [ D.Align !:= "left" ] [ text_ "9" ]
                      , D.td [ D.Align !:= "left" ] [ text_ "leather" ]
                      , D.td [ D.Align !:= "left" ] [ text_ "brown" ]
                      ]
                  , D.tr_
                      [ D.td [ D.Align !:= "left" ] [ text_ "10" ]
                      , D.td [ D.Align !:= "left" ] [ text_ "hemp canvas" ]
                      , D.td [ D.Align !:= "left" ] [ text_ "natural" ]
                      ]
                  , D.tr_
                      [ D.td [ D.Align !:= "left" ] [ text_ "11" ]
                      , D.td [ D.Align !:= "left" ] [ text_ "glass" ]
                      , D.td [ D.Align !:= "left" ] [ text_ "transparent" ]
                      ]
                  ]
              ]
          , D.p_ [ text_ "Multi-line tables:" ]
          , D.table [ D.Style !:= "width:46%;" ]
              [ D.colgroup_
                  [ D.col_ []
                  , D.col_ []
                  ]
              , D.thead_
                  [ D.tr_
                      [ D.th [ D.Align !:= "left" ] [ text_ "keyword" ]
                      , D.th [ D.Align !:= "left" ] [ text_ "text" ]
                      ]
                  ]
              , D.tbody_
                  [ D.tr_
                      [ D.td [ D.Align !:= "left" ] [ text_ "red" ]
                      , D.td [ D.Align !:= "left" ]
                          [ text_
                              "Sunsets, apples, and other red or reddish things."
                          ]
                      ]
                  , D.tr_
                      [ D.td [ D.Align !:= "left" ] [ text_ "green" ]
                      , D.td [ D.Align !:= "left" ]
                          [ text_
                              "Leaves, grass, frogs and other things it's not easy being."
                          ]
                      ]
                  ]
              ]
          , D.p_ [ text_ "A horizontal rule follows." ]
          , D.hr_ []
          , D.p_ [ text_ "Images are responsive by default:" ]
          , D.div_
              [ D.img
                  [ D.Alt !:= "example image"
                  , D.Src !:= "sakura.png"
                  , D.Title !:= "An exemplary image"
                  ]
                  []
              , D.p_ [ text_ "example image" ]
              ]
          , D.hr_ []
          , D.h1 [ D.Id !:= "form-elements" ] [ text_ "Form Elements" ]
          , D.form_
              [ D.div [ D.Id !:= "forms__input" ]
                  [ D.h3_ [ text_ "Input fields" ]
                  , D.p_
                      [ D.label [ D.For !:= "input__text" ]
                          [ text_ "Text Input" ]
                      , D.input
                          [ D.Id !:= "input__text"
                          , D.Placeholder !:= "Text Input"
                          , D.Xtype !:= "text"
                          ]
                          []
                      ]
                  , D.p_
                      [ D.label [ D.For !:= "input__password" ]
                          [ text_ "Password" ]
                      , D.input
                          [ D.Id !:= "input__password"
                          , D.Placeholder !:= "Type your Password"
                          , D.Xtype !:= "password"
                          ]
                          []
                      ]
                  , D.p_
                      [ D.label [ D.For !:= "input__webaddress" ]
                          [ text_ "Web Address" ]
                      , D.input
                          [ D.Id !:= "input__webaddress"
                          , D.Placeholder !:= "http://yoursite.com"
                          , D.Xtype !:= "url"
                          ]
                          []
                      ]
                  , D.p_
                      [ D.label [ D.For !:= "input__emailaddress" ]
                          [ text_ "Email Address" ]
                      , D.input
                          [ D.Id !:= "input__emailaddress"
                          , D.Placeholder !:= "name@email.com"
                          , D.Xtype !:= "email"
                          ]
                          []
                      ]
                  , D.p_
                      [ D.label [ D.For !:= "input__phone" ]
                          [ text_ "Phone Number" ]
                      , D.input
                          [ D.Id !:= "input__phone"
                          , D.Placeholder !:= "(999) 999-9999"
                          , D.Xtype !:= "tel"
                          ]
                          []
                      ]
                  , D.p_
                      [ D.label [ D.For !:= "input__search" ] [ text_ "Search" ]
                      , D.input
                          [ D.Id !:= "input__search"
                          , D.Placeholder !:= "Enter Search Term"
                          , D.Xtype !:= "search"
                          ]
                          []
                      ]
                  , D.p_
                      [ D.label [ D.For !:= "input__text2" ]
                          [ text_ "Number Input" ]
                      , D.input
                          [ D.Id !:= "input__text2"
                          , D.Placeholder !:= "Enter a Number"
                          , D.Xtype !:= "number"
                          ]
                          []
                      ]
                  , D.p_
                      [ D.label [ D.For !:= "input__text3" ] [ text_ "Error" ]
                      , D.input
                          [ D.Id !:= "input__text3"
                          , D.Placeholder !:= "Text Input"
                          , D.Xtype !:= "text"
                          ]
                          []
                      ]
                  , D.p_
                      [ D.label [ D.For !:= "input__text4" ] [ text_ "Valid" ]
                      , D.input
                          [ D.Id !:= "input__text4"
                          , D.Placeholder !:= "Text Input"
                          , D.Xtype !:= "text"
                          ]
                          []
                      ]
                  ]
              , D.p_ [ D.a [ D.Href !:= "#top" ] [ text_ "[Top]" ] ]
              , D.div [ D.Id !:= "forms__select" ]
                  [ D.h3_ [ text_ "Select menus" ]
                  , D.p_
                      [ D.label [ D.For !:= "select" ] [ text_ "Select" ]
                      , D.select [ D.Id !:= "select" ]
                          [ D.optgroup [ D.Label !:= "Option Group" ]
                              [ D.option_
                                  [ text_
                                      "\n              Option One\n            "
                                  ]
                              , D.option_
                                  [ text_
                                      "\n              Option Two\n            "
                                  ]
                              , D.option_
                                  [ text_
                                      "\n              Option Three\n            "
                                  ]
                              ]
                          ]
                      ]
                  ]
              , D.p_ [ D.a [ D.Href !:= "#top" ] [ text_ "[Top]" ] ]
              , D.div [ D.Id !:= "forms__checkbox" ]
                  [ D.h3_ [ text_ "Checkboxes" ]
                  , D.ul [ D.Style !:= "list-style:none;" ]
                      [ D.li_
                          [ D.label [ D.For !:= "checkbox1" ]
                              [ D.input
                                  [ D.Checked !:= "checked"
                                  , D.Id !:= "checkbox1"
                                  , D.Name !:= "checkbox"
                                  , D.Xtype !:= "checkbox"
                                  ]
                                  []
                              , text_ " Choice A"
                              ]
                          ]
                      , D.li_
                          [ D.label [ D.For !:= "checkbox2" ]
                              [ D.input
                                  [ D.Id !:= "checkbox2"
                                  , D.Name !:= "checkbox"
                                  , D.Xtype !:= "checkbox"
                                  ]
                                  []
                              , text_ " Choice B"
                              ]
                          ]
                      , D.li_
                          [ D.label [ D.For !:= "checkbox3" ]
                              [ D.input
                                  [ D.Id !:= "checkbox3"
                                  , D.Name !:= "checkbox"
                                  , D.Xtype !:= "checkbox"
                                  ]
                                  []
                              , text_ " Choice C"
                              ]
                          ]
                      ]
                  ]
              , D.p_ [ D.a [ D.Href !:= "#top" ] [ text_ "[Top]" ] ]
              , D.div [ D.Id !:= "forms__textareas" ]
                  [ D.h3_ [ text_ "Textareas" ]
                  , D.p_
                      [ D.label [ D.For !:= "textarea" ] [ text_ "Textarea" ]
                      , D.textarea
                          [ D.Cols !:= "48"
                          , D.Id !:= "textarea"
                          , D.Placeholder !:= "Enter your message here"
                          , D.Rows !:= "8"
                          ]
                          []
                      ]
                  ]
              , D.p_ [ D.a [ D.Href !:= "#top" ] [ text_ "[Top]" ] ]
              , D.div [ D.Id !:= "forms__html5" ]
                  [ D.div [ D.Id !:= "forms__action" ]
                      [ D.h3_ [ text_ "Action buttons" ]
                      , D.p_
                          [ D.input
                              [ D.Xtype !:= "submit"
                              , D.Value !:= "input type=submit"
                              ]
                              []
                          , D.input
                              [ D.Xtype !:= "button"
                              , D.Value !:= "input type=button"
                              ]
                              []
                          , D.input
                              [ D.Xtype !:= "reset"
                              , D.Value !:= "input type=reset"
                              ]
                              []
                          , D.input
                              [ D.Disabled !:= ""
                              , D.Xtype !:= "submit"
                              , D.Value !:= "input disabled"
                              ]
                              []
                          ]
                      , D.p_
                          [ D.button [ D.Xtype !:= "submit" ]
                              [ text_ "&lt;button type=submit&gt;" ]
                          , D.button [ D.Xtype !:= "button" ]
                              [ text_ "&lt;button type=button&gt;" ]
                          , D.button [ D.Xtype !:= "reset" ]
                              [ text_ "&lt;button type=reset&gt;" ]
                          , D.button [ D.Disabled !:= "", D.Xtype !:= "button" ]
                              [ text_ "&lt;button disabled&gt;" ]
                          ]
                      ]
                  , D.p_ [ D.a [ D.Href !:= "#top" ] [ text_ "[Top]" ] ]
                  ]
              ]
          , D.div_
              [ D.hr_ []
              , D.ol_
                  [ D.li [ D.Id !:= "fn1" ]
                      [ D.p_
                          [ text_ "Footnote text goes here."
                          , D.a [ D.Href !:= "#fnref1" ] [ text_ "↩" ]
                          ]
                      ]
                  ]
              ]
          ]
      ]