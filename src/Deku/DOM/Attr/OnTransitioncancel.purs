module Deku.DOM.Attr.OnTransitioncancel where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnTransitioncancel = OnTransitioncancel

instance Attr anything OnTransitioncancel Cb where
  pureAttr OnTransitioncancel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "transitioncancel", value: cb' value }
  mapAttr OnTransitioncancel evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "transitioncancel", value: cb' value }

instance Attr anything OnTransitioncancel (Effect Unit) where
  pureAttr OnTransitioncancel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }
  mapAttr OnTransitioncancel evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "transitioncancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitioncancel (Effect Boolean) where
  pureAttr OnTransitioncancel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "transitioncancel", value: cb' (Cb (const value)) }
  mapAttr OnTransitioncancel evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "transitioncancel", value: cb' (Cb (const value)) }

type OnTransitioncancelEffect =
  forall element
   . Attr element OnTransitioncancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTransitioncancel Unit where
  pureAttr OnTransitioncancel _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "transitioncancel", value: unset' }

  mapAttr OnTransitioncancel evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "transitioncancel", value: unset' }