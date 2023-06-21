module Deku.DOM.Attr.OnPointerlockerror where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnPointerlockerror = OnPointerlockerror

instance Attr anything OnPointerlockerror Cb where
  pureAttr OnPointerlockerror value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerlockerror ", value: cb' value }
  mapAttr OnPointerlockerror evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "pointerlockerror ", value: cb' value }

instance Attr anything OnPointerlockerror (Effect Unit) where
  pureAttr OnPointerlockerror value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerlockerror ", value: cb' (Cb (const (value $> true))) }
  mapAttr OnPointerlockerror evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "pointerlockerror ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerlockerror (Effect Boolean) where
  pureAttr OnPointerlockerror value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerlockerror ", value: cb' (Cb (const value)) }
  mapAttr OnPointerlockerror evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "pointerlockerror ", value: cb' (Cb (const value)) }

type OnPointerlockerrorEffect =
  forall element
   . Attr element OnPointerlockerror (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerlockerror Unit where
  pureAttr OnPointerlockerror _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointerlockerror ", value: unset' }

  mapAttr OnPointerlockerror evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "pointerlockerror ", value: unset' }