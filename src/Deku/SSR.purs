module Deku.SSR where

import Prelude

import Control.Alt ((<|>))
import Data.Array as Array
import Data.Either (Either(..))
import Data.List (List(..), (:))
import Data.List as List
import Data.Maybe (Maybe(..))
import Data.Traversable (sequence)
import Data.Variant (on)
import Deku.Control.Types (Frame0, SubScene)
import Deku.Graph.Attribute (AttributeValue, prop)
import Deku.Interpret (AsSubgraphHack(..), SubgraphInput, connectXToY, makeElement, makeRoot, makeSubgraph, makeText, makeTumult)
import Deku.Rendered (Instruction(..))
import Deku.Rendered as R
import Deku.Tumult.Make (Indecent(..))
import Foreign.Object (Object, empty, lookup, insert, singleton, union, update)
import Type.Proxy (Proxy(..))

foreign import massiveCreate_
  :: ( forall terminus env push
        . AsSubgraphHack terminus env
       -> Int
       -> SubScene terminus env Unit Instruction Frame0 push Unit
     )
  -> ( forall terminus env push
        . SubgraphInput terminus env push Unit Instruction
       -> Unit
       -> Instruction
     )
  -> (R.MakeTumult -> Unit -> Instruction)
  -> (R.MakeRoot -> Unit -> Instruction)
  -> (R.MakeElement -> Unit -> Instruction)
  -> (R.MakeText -> Unit -> Instruction)
  -> (R.ConnectXToY -> Unit -> Instruction)
  -> R.MassiveCreate
  -> Unit
  -> Array Instruction

applySubgraph
  :: String -> String -> Array (Array Instruction) -> Object Indecent
applySubgraph terminus id aaI =
  case
    ( E "div" [] <$>
        ( sequence $ map
            (\iss -> ssr' terminus false iss)
            aaI
        )
    )
    of
    -- should never happen
    -- should we propagate the error?
    Nothing -> empty
    Just x -> singleton id x

resolveAllSubgraphs :: List Instruction -> Object Indecent
resolveAllSubgraphs ((Instruction a) : b) = union
  ( on
      ( Proxy
          :: Proxy
            "makeSubgraph"
      )
      ( \{ id, instructions, terminus } -> applySubgraph terminus id
          instructions
      )
      (const empty)
      a
  )
  (resolveAllSubgraphs b)
resolveAllSubgraphs Nil = empty

type Adjacency = Either String
  { tag :: String
  , attributes :: Array { key :: String, value :: AttributeValue }
  , incoming :: List String
  }

doMakeStep :: List Instruction -> Object Adjacency
doMakeStep ((Instruction a) : b) = union
  ( on
      ( Proxy
          :: Proxy
            "makeElement"
      )
      ( \{ id, tag, attributes } -> singleton id
          (Right { tag, attributes, incoming: Nil })
      )
      ( on
          ( Proxy
              :: Proxy
                "makeText"
          )
          (\{ id, text } -> singleton id (Left text))
          (const empty)
      )
      a
  )
  (doMakeStep b)
doMakeStep Nil = empty

doConnectStep :: List Instruction -> Object Adjacency -> Object Adjacency
doConnectStep ((Instruction a) : b) adj =
  on
    ( Proxy
        :: Proxy
          "connectXToY"
    )
    ( \{ fromId, toId } -> doConnectStep b
        ( update
            ( \a' -> Just $ case a' of
                Left _ -> a'
                Right aa -> Right (aa { incoming = aa.incoming <> pure fromId })
            )
            toId
            adj
        )
    )
    (\_ -> doConnectStep b adj)
    a
doConnectStep Nil adj = adj

adjacenciesToGraph
  :: String -> Object Adjacency -> Object Indecent -> Maybe Indecent
adjacenciesToGraph needle adjacencies indecents =
  lookup needle adjacencies >>= case _ of
    Left txt -> pure (T txt)
    Right { tag, attributes, incoming } ->
      E tag attributes <$>
        ( sequence $ Array.fromFoldable
            ( map
                ( \id -> adjacenciesToGraph id adjacencies indecents <|> lookup
                    id
                    indecents
                )
                incoming
            )
        )

-- todo
-- this does not account for destructions
-- or deconnections, which are unlikely to happen
-- during the first frame
-- to be fully robust, it'd need to do that,
-- but this is good for 95%
-- of real-world cases
ssr :: Array Instruction -> Maybe Indecent
ssr a = ssr' "root" true a

mcUnsubgraph
  :: forall terminus env push
   . AsSubgraphHack terminus env
  -> Int
  -> SubScene terminus env Unit Instruction Frame0 push Unit
mcUnsubgraph (AsSubgraphHack i) = i

expandMassiveCreate :: List Instruction -> List Instruction
expandMassiveCreate (a@(Instruction aa) : b) =
  on
    (Proxy :: Proxy "massiveCreate")
    ( \tc -> List.fromFoldable
        ( massiveCreate_ mcUnsubgraph makeSubgraph makeTumult
            makeRoot
            makeElement
            makeText
            connectXToY
            tc
            unit
        )
    )
    (\_ -> pure a)
    aa <> expandMassiveCreate b
expandMassiveCreate Nil = Nil

ssr' :: String -> Boolean -> Array Instruction -> Maybe Indecent
ssr' tmus hd a = o
  where
  asList' = List.fromFoldable a
  asList = expandMassiveCreate asList'
  indecentSubgraphs = resolveAllSubgraphs asList
  makeStep = doMakeStep asList
  connectStep = doConnectStep asList
    ( if hd then insert "root"
        ( Right
            { tag: "div"
            , attributes: [ { key: "style", value: prop "display:content;" } ]
            , incoming: Nil
            }
        )
        makeStep
      else makeStep
    )
  o = adjacenciesToGraph tmus connectStep indecentSubgraphs
