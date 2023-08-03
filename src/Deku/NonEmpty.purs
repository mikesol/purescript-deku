-- | Utilities for common operations done with `NonEmpty`.
module Deku.NonEmpty where

import Prelude

import Data.Either (Either(..))
import Data.Filterable as Filterable
import Data.Maybe (Maybe(..))
import Data.NonEmpty (NonEmpty, (:|))
import Deku.Attribute (class Attr, Attribute, (:=))
import FRP.Event (Event)

rehead :: forall f a. a -> NonEmpty f a -> NonEmpty f a
rehead hn (_ :| t) = hn :| t

retail :: forall f a. f a -> NonEmpty f a -> NonEmpty f a
retail tn (h :| _) = h :| tn

filterMap
  :: forall f a b
   . Filterable.Filterable f
  => (a -> Maybe b)
  -> NonEmpty f a
  -> Either (f b) (NonEmpty f b)
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

filterMapAttribute
  :: forall e at a b
   . Attr e at (Event b)
  => Attr e at (NonEmpty Event b)
  => at
  -> (a -> Maybe b)
  -> NonEmpty Event a
  -> Attribute e
filterMapAttribute a f ne = case filterMap f ne of
  Left x -> a := x
  Right y -> a := y

filterAttribute
  :: forall e at a
   . Attr e at (Event a)
  => Attr e at (NonEmpty Event a)
  => at
  -> (a -> Boolean)
  -> NonEmpty Event a
  -> Attribute e
filterAttribute a f ne = case filter f ne of
  Left x -> a := x
  Right y -> a := y
