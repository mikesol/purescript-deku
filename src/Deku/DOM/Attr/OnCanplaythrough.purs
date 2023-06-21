module Deku.DOM.Attr.OnCanplaythrough where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnCanplaythrough = OnCanplaythrough

instance Attr anything OnCanplaythrough Cb where
  pureAttr OnCanplaythrough value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnCanplaythrough evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "canplaythrough", value: cb' value }

instance Attr anything OnCanplaythrough (Effect Unit) where
  pureAttr OnCanplaythrough value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnCanplaythrough evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "canplaythrough", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnCanplaythrough (Effect Boolean) where
  pureAttr OnCanplaythrough value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnCanplaythrough evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "canplaythrough", value: cb' (Cb (const value)) }

type OnCanplaythroughEffect =
  forall element
   . Attr element OnCanplaythrough (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnCanplaythrough Unit where
  pureAttr OnCanplaythrough _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "canplaythrough", value: unset' }
