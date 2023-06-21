module Deku.DOM.Attr.OnResize where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnResize = OnResize

instance Attr anything OnResize Cb where
  pureAttr OnResize value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "resize", value: cb' value }
  mapAttr OnResize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "resize", value: cb' value }

instance Attr anything OnResize (Effect Unit) where
  pureAttr OnResize value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnResize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "resize", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnResize (Effect Boolean) where
  pureAttr OnResize value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnResize evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "resize", value: cb' (Cb (const value)) }

type OnResizeEffect =
  forall element
   . Attr element OnResize (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnResize Unit where
  pureAttr OnResize _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "resize", value: unset' }
  mapAttr OnResize evalue = unsafeAttribute $ Right $ evalue <#> \value -> unsafeVolatileAttribute
    { key: "resize", value: unset' }
