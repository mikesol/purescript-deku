-- | Utilities for common operations done with `NonEmpty`.
module Deku.NonEmpty where

import Prelude

import Data.Either (Either(..))
import Data.Filterable as Filterable
import Data.Maybe (Maybe(..))
import Data.NonEmpty (NonEmpty, (:|))

rehead :: forall f a. a -> NonEmpty f a -> NonEmpty f a
rehead hn (_ :| t) = hn :| t

retail :: forall f a. f a -> NonEmpty f a -> NonEmpty f a
retail tn (h :| _) = h :| tn

filterMap
  :: forall f a
   . Filterable.Filterable f
  => (a -> Maybe a)
  -> NonEmpty f a
  -> Either (f a) (NonEmpty f a)
filterMap f (h :| t) =
  let
    tn = Filterable.filterMap f t
  in
    case f h of
      Nothing -> Left tn
      Just hn -> Right (hn :| tn)

filter
  :: forall f a
   . Filterable.Filterable f
  => (a -> Boolean)
  -> NonEmpty f a
  -> Either (f a) (NonEmpty f a)
filter f = filterMap (\i -> if f i then Just i else Nothing)

thisThen :: forall f a. a -> (a -> f a) -> NonEmpty f a
thisThen a f = a :| f a

apne
  :: forall f a b
   . Functor f
  => Apply f
  => NonEmpty f (a -> b)
  -> NonEmpty f a
  -> NonEmpty f b
apne (a' :| as') (b' :| bs') = a' b' :| (as' <*> bs')

infixl 4 apne as <**>