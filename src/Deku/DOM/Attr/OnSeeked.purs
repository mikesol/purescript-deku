module Deku.DOM.Attr.OnSeeked where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnSeeked = OnSeeked

instance Attr anything OnSeeked Cb where
  pureAttr OnSeeked value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "seeked", value: cb' value }
  mapAttr OnSeeked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "seeked", value: cb' value }

instance Attr anything OnSeeked (Effect Unit) where
  pureAttr OnSeeked value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "seeked", value: cb' (Cb (const (value $> true))) }
  mapAttr OnSeeked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "seeked", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSeeked (Effect Boolean) where
  pureAttr OnSeeked value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "seeked", value: cb' (Cb (const value)) }
  mapAttr OnSeeked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "seeked", value: cb' (Cb (const value)) }

type OnSeekedEffect =
  forall element
   . Attr element OnSeeked (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSeeked Unit where
  pureAttr OnSeeked _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "seeked", value: unset' }
  mapAttr OnSeeked evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "seeked", value: unset' }
