module Deku.DOM.Attr.OnReset where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnReset = OnReset

instance Attr anything OnReset Cb where
  pureAttr OnReset value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "reset", value: cb' value }
  mapAttr OnReset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "reset", value: cb' value }

instance Attr anything OnReset (Effect Unit) where
  pureAttr OnReset value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "reset", value: cb' (Cb (const (value $> true))) }
  mapAttr OnReset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "reset", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnReset (Effect Boolean) where
  pureAttr OnReset value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "reset", value: cb' (Cb (const value)) }
  mapAttr OnReset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "reset", value: cb' (Cb (const value)) }

type OnResetEffect =
  forall element
   . Attr element OnReset (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnReset Unit where
  pureAttr OnReset _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "reset", value: unset' }
  mapAttr OnReset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "reset", value: unset' }
