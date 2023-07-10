-- @inline Data.Filterable.filterableArray(..).partitionMap always
-- @inline Data.List.fromFoldable always
-- @inline Deku.Core.resolveNut always
-- @inline Deku.Control.foldlArray always
-- @inline Deku.Control.foldlArray2 always
-- @inline Deku.Control.elementify3 always
-- @inline Deku.Toplevel.runInBody always
-- @inline Deku.Toplevel.runInBody' always
-- @inline Deku.Toplevel.runInElement' always
-- @inline Deku.Control.deku always
-- @inline Deku.DOM.Elt.Li.li__ always
-- @inline Deku.DOM.Elt.P.p_ always
-- @inline Deku.DOM.Elt.Div.div always
-- @inline Deku.Control.filterMapArray always
-- @inline Deku.Control.filterArray always
-- @inline Deku.Control.compactArray always
-- @inline Deku.Control.amassKoroks always
-- @inline Deku.Control.actualizeNuts always
-- @inline Deku.Control.nutsToHtml always
-- @inline Deku.Control.unzipArray always
module Deku.Example.Optimus where

import Prelude

import Deku.Attributes (klass_, klass)
import Deku.Control (text_, (<#~>))
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (create)

-- main1 :: Effect Unit
-- main1 = do
--   runInBody do
--     D.div [ klass_ "green-text" ] [ D.ul_ [ D.li__ "hello", D.li__ "world" ] ]

-- main2 :: Effect Unit
-- main2 = do
--   { event } <- create
--   runInBody do
--     D.div [ klass_ "white-text" ]
--       [ D.ul_
--           [ D.li__ "test.no.2"
--           , D.li [ klass event ] [ text_ "works" ]
--           ]
--       ]

main3 :: Effect Unit
main3 = runInBody do
  let
    d x = D.div [ klass_ "blue-text" ]
      [ D.ul_ [ x ]
      , D.ul_ [ D.li__ "hello" ]
      , D.ul_ [ D.li__ "hello" ]
      , D.ul_ [ D.li__ "hello" ]
      , D.ul_ [ D.li__ "hello" ]
      , D.ul_ [ D.li__ "hello" ]
      , D.ul_ [ D.li__ "hello" ]
      ]
  -- craaaash
  -- d $ d $ d $ d $ d $ text_ "world"
  -- craaaash
  -- d $ d $ d $ d $ text_ "world"
  -- fails to inline
  -- d $ d $ d $ text_ "world"
  d $ d $ text_ "world"

-- main4 :: Effect Unit
-- main4 = do
--   { event } <- create
--   runInBody do
--     D.div [ klass_ "white-text" ]
--       [ D.ul_
--           [ D.li__ "test.no.2"
--           , event <#~> case _ of
--               "foo" -> D.p_ [ D.div__ "pThenDiv" ]
--               _ -> D.div_ [ D.p__ "divThenP" ]
--           , D.li [ klass event ] [ text_ "works" ]
--           ]
--       ]