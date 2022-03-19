module Deku.Disconnect where

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
import Deku.Interpret (class DOMInterpret, disconnectXFromY)

idisconnect
  :: forall proxy source dest dom engine proof res i o
   . DOMInterpret dom engine
  => Disconnect source dest i o
  => { source :: proxy source, dest :: proxy dest }
  -> IxDOM dom engine proof res i o Unit
idisconnect ptrs = IxDOM (disconnect <<< voidRight ptrs)

-- | Disconnect node `source` from node `dest` in graph `i`, resulting in output graph `o`.
class
  Disconnect (source :: Symbol) (dest :: Symbol) (i :: Graph) (o :: Graph)
  | source dest i -> o where
  disconnect
    :: forall proxy dom engine proof res
     . DOMInterpret dom engine
    => DOM dom engine proof res i
         { source :: proxy source, dest :: proxy dest }
    -> DOM dom engine proof res o Unit

instance disconnector ::
  ( IsSymbol from
  , IsSymbol to
  , TypeToSym fromN fromSym
  , TypeToSym toN toSym
  , IsSymbol fromSym
  , IsSymbol toSym
  , R.Cons from (NodeC fromN ignoreEdges) ignore1 graphi
  , R.Cons to (NodeC toN { | e }) newg graphi
  , R.Cons from Unit e' e
  , R.Lacks from e'
  , R.Cons to (NodeC toN { | e' }) newg grapho
  ) =>
  Disconnect from to graphi grapho where
  disconnect w =
    unsafeDOM
      { context:
          i
            { instructions = i.instructions <>
                [ disconnectXFromY
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
