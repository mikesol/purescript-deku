module Deku.DOM.Attr.OnSelect where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnSelect = OnSelect

instance Attr anything OnSelect Cb where
  pureAttr OnSelect value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "select", value: cb' value }
  mapAttr OnSelect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "select", value: cb' value }

instance Attr anything OnSelect (Effect Unit) where
  pureAttr OnSelect value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnSelect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "select", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSelect (Effect Boolean) where
  pureAttr OnSelect value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnSelect evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "select", value: cb' (Cb (const value)) }

type OnSelectEffect =
  forall element
   . Attr element OnSelect (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSelect Unit where
  pureAttr OnSelect _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "select", value: unset' }
  mapAttr OnSelect evalue = unsafeAttribute $ Right $ evalue <#> \value -> unsafeVolatileAttribute
    { key: "select", value: unset' }
