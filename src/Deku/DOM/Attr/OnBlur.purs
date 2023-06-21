module Deku.DOM.Attr.OnBlur where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnBlur = OnBlur

instance Attr anything OnBlur Cb where
  pureAttr OnBlur value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "blur", value: cb' value }
  mapAttr OnBlur evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "blur", value: cb' value }

instance Attr anything OnBlur (Effect Unit) where
  pureAttr OnBlur value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "blur", value: cb' (Cb (const (value $> true))) }
  mapAttr OnBlur evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "blur", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnBlur (Effect Boolean) where
  pureAttr OnBlur value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "blur", value: cb' (Cb (const value)) }
  mapAttr OnBlur evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "blur", value: cb' (Cb (const value)) }

type OnBlurEffect =
  forall element. Attr element OnBlur (Effect Unit) => Event (Attribute element)

instance Attr everything OnBlur Unit where
  pureAttr OnBlur _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "blur", value: unset' }
  mapAttr OnBlur evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "blur", value: unset' }
