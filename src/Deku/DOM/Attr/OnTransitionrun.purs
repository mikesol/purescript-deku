module Deku.DOM.Attr.OnTransitionrun where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnTransitionrun = OnTransitionrun

instance Attr anything OnTransitionrun Cb where
  pureAttr OnTransitionrun value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnTransitionrun evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transitionrun", value: cb' value }

instance Attr anything OnTransitionrun (Effect Unit) where
  pureAttr OnTransitionrun value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnTransitionrun evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transitionrun", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTransitionrun (Effect Boolean) where
  pureAttr OnTransitionrun value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnTransitionrun evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "transitionrun", value: cb' (Cb (const value)) }

type OnTransitionrunEffect =
  forall element
   . Attr element OnTransitionrun (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTransitionrun Unit where
  pureAttr OnTransitionrun _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "transitionrun", value: unset' }
