module Deku.Connect where

import Prelude hiding (Ordering(..))

import Data.Functor (voidRight)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Prim.Row as R
import Type.Proxy (Proxy(..))
import Deku.Control.Indexed (IxDOM(..))
import Deku.Control.Types (DOM, unsafeUnDOM, unsafeDOM)
import Deku.Graph.DOM (class TypeToSym)
import Deku.Graph.Graph (Graph)
import Deku.Graph.Node (NodeC)
import Deku.Interpret (class DOMInterpret, connectXToY)

iconnect
  :: forall proxy source dest dom engine proof res i o
   . DOMInterpret dom engine
  => Connect source dest i o
  => { source :: proxy source, dest :: proxy dest }
  -> IxDOM dom engine proof res i o Unit
iconnect ptrs = IxDOM (connect <<< voidRight ptrs)

-- | Connect node `source` from node `dest` in graph `i`, resulting in output graph `o`.
class
  Connect (source :: Symbol) (dest :: Symbol) (i :: Graph) (o :: Graph)
  | source dest i -> o where
  connect
    :: forall proxy dom engine proof res
     . DOMInterpret dom engine
    => DOM dom engine proof res i
         { source :: proxy source, dest :: proxy dest }
    -> DOM dom engine proof res o Unit

instance connectInstance ::
  ( IsSymbol from
  , IsSymbol to
  , TypeToSym fromN fromSym
  , TypeToSym toN toSym
  , IsSymbol fromSym
  , IsSymbol toSym
  , R.Cons from (NodeC fromN ignoreEdges) ignore1 graphi
  , R.Cons to (NodeC toN { | e }) newg graphi
  , R.Lacks from e
  , R.Cons from Unit e e'
  , R.Cons to (NodeC toN { | e' }) newg grapho
  ) =>
  Connect from to graphi grapho where
  connect w =
    unsafeDOM
      { context:
          i
            { instructions = i.instructions <>
                [ connectXToY
                    { fromId
                    , fromUnit: reflectSymbol (Proxy :: _ fromSym)
                    , toId
                    , toUnit: reflectSymbol (Proxy :: _ toSym)
                    }
                ]
            }
      , value: unit
      }
    where
    { context: i, value: { source: fromI', dest: toI' } } = unsafeUnDOM w

    fromId = reflectSymbol fromI'

    toId = reflectSymbol toI'

class
  ConnectT (source :: Symbol) (dest :: Symbol) (i :: Graph) (o :: Graph)
  | source dest i -> o

instance connectTInstance ::
  ( R.Cons from ignore0 ignore1 graphi
  , R.Cons to (NodeC n { | e }) newg graphi
  , R.Lacks from e
  , R.Cons from Unit e e'
  , R.Cons to (NodeC n { | e' }) newg grapho
  ) =>
  ConnectT from to graphi grapho