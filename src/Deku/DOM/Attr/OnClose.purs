module Deku.DOM.Attr.OnClose where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnClose = OnClose

instance Attr anything OnClose Cb where
  pureAttr OnClose value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "close", value: cb' value }
  mapAttr OnClose evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "close", value: cb' value }

instance Attr anything OnClose (Effect Unit) where
  pureAttr OnClose value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnClose evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "close", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnClose (Effect Boolean) where
  pureAttr OnClose value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnClose evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "close", value: cb' (Cb (const value)) }

type OnCloseEffect =
  forall element
   . Attr element OnClose (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnClose Unit where
  pureAttr OnClose _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "close", value: unset' }
  mapAttr OnClose evalue = unsafeAttribute $ Right $ evalue <#> \value -> unsafeVolatileAttribute
    { key: "close", value: unset' }
