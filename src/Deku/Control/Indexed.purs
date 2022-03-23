module Deku.Control.Monadic where

import Prelude

import Control.Comonad (extract)
import Data.Functor (voidRight)
import Deku.Control.Types (DOM)

newtype MDOM
  (dom :: Type)
  (engine :: Type)
  (proof :: Type)
  (res :: Type)
  (graph :: Row Type)
  (a :: Type) = MDOM
  ( forall q
     . DOM dom engine proof res graph q
    -> DOM dom engine proof res graph a
  )

instance functorMDOM :: Functor (MDOM dom engine proof res graph) where
  map f (MDOM a) = MDOM ((map <<< map) f a)

instance applyMDOM :: Apply (MDOM dom engine proof res graph) where
  apply (MDOM fab') (MDOM a') =
    MDOM \i ->
      let
        fab = fab' i
        a = a' fab
      in
        a $> ((extract fab) (extract a))
instance applicativeMDOM ::
  Applicative (MDOM dom engine proof res graph) where
  pure a = MDOM (voidRight a)

instance bindIxWag :: Bind (MDOM dom engine proof res graph) where
  bind (MDOM ma') aToB =
    MDOM \i ->
      let
        ma = ma' i
        MDOM b = aToB (extract ma)
      in
        b ma

instance monadIxWag :: Monad (MDOM dom engine proof res graph)
