module Deku.DOM.Attr.OnLoad where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnLoad = OnLoad

instance Attr anything OnLoad Cb where
  pureAttr OnLoad value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "load", value: cb' value }
  mapAttr OnLoad evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "load", value: cb' value }

instance Attr anything OnLoad (Effect Unit) where
  pureAttr OnLoad value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "load", value: cb' (Cb (const (value $> true))) }
  mapAttr OnLoad evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "load", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoad (Effect Boolean) where
  pureAttr OnLoad value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "load", value: cb' (Cb (const value)) }
  mapAttr OnLoad evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "load", value: cb' (Cb (const value)) }

type OnLoadEffect =
  forall element. Attr element OnLoad (Effect Unit) => Event (Attribute element)

instance Attr everything OnLoad Unit where
  pureAttr OnLoad _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "load", value: unset' }
  mapAttr OnLoad evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "load", value: unset' }
