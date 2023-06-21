module Deku.DOM.Attr.OnTransitionend where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnTransitionend = OnTransitionend

instance Attr anything OnTransitionend Cb where
  pureAttr OnTransitionend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "transitionend", value: cb' value }
  mapAttr OnTransitionend evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "transitionend", value: cb' value }

instance Attr anything OnTransitionend (Effect Unit) where
  pureAttr OnTransitionend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "transitionend", value: cb' (Cb (const (value $> true))) }
  mapAttr OnTransitionend evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "transitionend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionend (Effect Boolean) where
  pureAttr OnTransitionend value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "transitionend", value: cb' (Cb (const value)) }
  mapAttr OnTransitionend evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "transitionend", value: cb' (Cb (const value)) }

type OnTransitionendEffect =
  forall element
   . Attr element OnTransitionend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTransitionend Unit where
  pureAttr OnTransitionend _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "transitionend", value: unset' }

  mapAttr OnTransitionend evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "transitionend", value: unset' }