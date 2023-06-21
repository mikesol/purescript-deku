module Deku.DOM.Attr.OnClick where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnClick = OnClick

instance Attr anything OnClick Cb where
  pureAttr OnClick value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "click", value: cb' value }
  mapAttr OnClick evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "click", value: cb' value }

instance Attr anything OnClick (Effect Unit) where
  pureAttr OnClick value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnClick evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "click", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnClick (Effect Boolean) where
  pureAttr OnClick value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnClick evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "click", value: cb' (Cb (const value)) }

type OnClickEffect =
  forall element
   . Attr element OnClick (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnClick Unit where
  pureAttr OnClick _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "click", value: unset' }
  mapAttr OnClick evalue = unsafeAttribute $ Right $ evalue <#> \value -> unsafeVolatileAttribute
    { key: "click", value: unset' }
