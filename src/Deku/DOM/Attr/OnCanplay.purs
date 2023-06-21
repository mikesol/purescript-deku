module Deku.DOM.Attr.OnCanplay where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnCanplay = OnCanplay

instance Attr anything OnCanplay Cb where
  pureAttr OnCanplay value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "canplay", value: cb' value }
  mapAttr OnCanplay evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "canplay", value: cb' value }

instance Attr anything OnCanplay (Effect Unit) where
  pureAttr OnCanplay value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnCanplay evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "canplay", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnCanplay (Effect Boolean) where
  pureAttr OnCanplay value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnCanplay evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "canplay", value: cb' (Cb (const value)) }

type OnCanplayEffect =
  forall element
   . Attr element OnCanplay (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnCanplay Unit where
  pureAttr OnCanplay _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "canplay", value: unset' }
