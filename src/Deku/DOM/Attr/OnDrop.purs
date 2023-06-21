module Deku.DOM.Attr.OnDrop where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnDrop = OnDrop

instance Attr anything OnDrop Cb where
  pureAttr OnDrop value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "drop", value: cb' value }
  mapAttr OnDrop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "drop", value: cb' value }

instance Attr anything OnDrop (Effect Unit) where
  pureAttr OnDrop value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnDrop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "drop", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDrop (Effect Boolean) where
  pureAttr OnDrop value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnDrop evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "drop", value: cb' (Cb (const value)) }

type OnDropEffect =
  forall element. Attr element OnDrop (Effect Unit) => Event (Attribute element)

instance Attr everything OnDrop Unit where
  pureAttr OnDrop _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "drop", value: unset' }
  mapAttr OnDrop evalue = unsafeAttribute $ Right $ evalue <#> \value -> unsafeVolatileAttribute
    { key: "drop", value: unset' }
