module Deku.DOM.Attr.OnFocus where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnFocus = OnFocus

instance Attr anything OnFocus Cb where
  pureAttr OnFocus value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "focus", value: cb' value }
  mapAttr OnFocus evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "focus", value: cb' value }

instance Attr anything OnFocus (Effect Unit) where
  pureAttr OnFocus value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnFocus evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "focus", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnFocus (Effect Boolean) where
  pureAttr OnFocus value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnFocus evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "focus", value: cb' (Cb (const value)) }

type OnFocusEffect =
  forall element
   . Attr element OnFocus (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnFocus Unit where
  pureAttr OnFocus _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "focus", value: unset' }
  mapAttr OnFocus evalue = unsafeAttribute $ Right $ evalue <#> \value -> unsafeVolatileAttribute
    { key: "focus", value: unset' }
