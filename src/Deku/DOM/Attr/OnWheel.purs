module Deku.DOM.Attr.OnWheel where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnWheel = OnWheel

instance Attr anything OnWheel Cb where
  pureAttr OnWheel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "wheel", value: cb' value }
  mapAttr OnWheel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "wheel", value: cb' value }

instance Attr anything OnWheel (Effect Unit) where
  pureAttr OnWheel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "wheel", value: cb' (Cb (const (value $> true))) }
  mapAttr OnWheel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "wheel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnWheel (Effect Boolean) where
  pureAttr OnWheel value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "wheel", value: cb' (Cb (const value)) }
  mapAttr OnWheel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "wheel", value: cb' (Cb (const value)) }

type OnWheelEffect =
  forall element
   . Attr element OnWheel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnWheel Unit where
  pureAttr OnWheel _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "wheel", value: unset' }
  mapAttr OnWheel evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "wheel", value: unset' }
