module Deku.Destroy where

import Prelude

import Data.Functor (voidRight)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Data.Tuple.Nested (type (/\))
import Prim.Row as R
import Prim.RowList (class RowToList)
import Prim.RowList as RL
import Type.Proxy (Proxy(..))
import Deku.Control.Indexed (IxDOM(..))
import Deku.Control.Types (DOM, unsafeUnDOM, unsafeDOM)
import Deku.Graph.DOM (class TypeToSym)
import Deku.Graph.Graph (Graph)
import Deku.Graph.Node (NodeC, NodeList)
import Deku.Interpret (class DOMInterpret, destroyUnit)

idestroy
  :: forall proxy ptr dom engine proof res i o
   . DOMInterpret dom engine
  => Destroy ptr i o
  => proxy ptr
  -> IxDOM dom engine proof res i o Unit
idestroy ptr = IxDOM (destroy <<< voidRight ptr)

-- | Destroy node `ptr` in graph `i`, resulting in graph `o`. Note that, to destroy a node, it must have no outgoing or incoming edges. This is achieved via use of `disconnect`. Failure to disconnect nodes before destroying will result in a compile-time error during graph validation.
class Destroy (ptr :: Symbol) (i :: Graph) (o :: Graph) | ptr i -> o where
  destroy
    :: forall proxy dom engine proof res
     . DOMInterpret dom engine
    => DOM dom engine proof res i (proxy ptr)
    -> DOM dom engine proof res o Unit

instance destroyer ::
  ( IsSymbol ptr
  , TypeToSym node nodeSym
  , IsSymbol nodeSym
  , R.Cons ptr (node /\ {}) grapho graphi
  , RowToList graphi nodeListI
  , PointerNotPresentInAnyEdgeList ptr nodeListI
  ) =>
  Destroy ptr graphi grapho where
  destroy w =
    unsafeDOM
      $
        { context:
            i
              { instructions = i.instructions <>
                  [ destroyUnit { id, unit: reflectSymbol (Proxy :: _ nodeSym) }
                  ]
              }
        , value: unit
        }
    where
    { context: i, value: ptrI' } = unsafeUnDOM w

    id = reflectSymbol ptrI'

-- | Internal helper class used for destroing dom nodes.
class PointerNotPresentInAnyEdgeList (ptr :: Symbol) (i :: NodeList)

instance pointerNotPresentInAnyEdgeListNil ::
  PointerNotPresentInAnyEdgeList a RL.Nil

instance pointerNotPresentInAnyEdgeListCons ::
  ( R.Lacks a l
  , PointerNotPresentInAnyEdgeList a tail
  ) =>
  PointerNotPresentInAnyEdgeList a (RL.Cons h (NodeC n { | l }) tail)
