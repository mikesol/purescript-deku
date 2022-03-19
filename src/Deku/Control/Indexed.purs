module Deku.Control.Indexed where

import Prelude

import Control.Applicative.Indexed (class IxApplicative, class IxApply, iapply, ipure)
import Control.Bind.Indexed (class IxBind, ibind)
import Control.Comonad (extract)
import Control.Monad.Indexed (class IxMonad)
import Data.Functor (voidRight)
import Data.Functor.Indexed (class IxFunctor)
import Deku.Control.Types (DOM)

newtype IxDOM
  (dom :: Type)
  (engine :: Type)
  (proof :: Type)
  (res :: Type)
  (graphi :: Row Type)
  (grapho :: Row Type)
  (a :: Type) = IxDOM
  ( forall q
     . DOM dom engine proof res graphi q
    -> DOM dom engine proof res grapho a
  )

instance functorIxDOM :: Functor (IxDOM dom engine proof res graphi grapho) where
  map f (IxDOM a) = IxDOM ((map <<< map) f a)

instance ixFunctorIxDOM :: IxFunctor (IxDOM dom engine proof res) where
  imap f (IxDOM a) = IxDOM ((map <<< map) f a)

instance ixApplyIxDOM :: IxApply (IxDOM dom engine proof res) where
  iapply (IxDOM fab') (IxDOM a') =
    IxDOM \i ->
      let
        fab = fab' i
        a = a' fab
      in
        a $> ((extract fab) (extract a))

instance applyIxDOM :: Apply (IxDOM dom engine proof res graph graph) where
  apply = iapply

instance ixApplicativeIxDOM :: IxApplicative (IxDOM dom engine proof res) where
  ipure a = IxDOM (voidRight a)

instance applicativeIxDOM ::
  Applicative (IxDOM dom engine proof res graph graph) where
  pure = ipure

instance ixBindIxDOM :: IxBind (IxDOM dom engine proof res) where
  ibind (IxDOM ma') aToB =
    IxDOM \i ->
      let
        ma = ma' i
        IxDOM b = aToB (extract ma)
      in
        b ma

instance bindIxWag :: Bind (IxDOM dom engine proof res graph graph) where
  bind = ibind

instance ixMonadIxDOM :: IxMonad (IxDOM dom engine proof res)

instance monadIxWag :: Monad (IxDOM dom engine proof res graph graph)
