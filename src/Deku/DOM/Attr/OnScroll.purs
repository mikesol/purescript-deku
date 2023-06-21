module Deku.DOM.Attr.OnScroll where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnScroll = OnScroll

instance Attr anything OnScroll Cb where
  pureAttr OnScroll value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "scroll", value: cb' value }
  mapAttr OnScroll evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "scroll", value: cb' value }

instance Attr anything OnScroll (Effect Unit) where
  pureAttr OnScroll value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "scroll", value: cb' (Cb (const (value $> true))) }
  mapAttr OnScroll evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "scroll", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnScroll (Effect Boolean) where
  pureAttr OnScroll value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "scroll", value: cb' (Cb (const value)) }
  mapAttr OnScroll evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "scroll", value: cb' (Cb (const value)) }

type OnScrollEffect =
  forall element
   . Attr element OnScroll (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnScroll Unit where
  pureAttr OnScroll _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "scroll", value: unset' }
  mapAttr OnScroll evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "scroll", value: unset' }
