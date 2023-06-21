module Deku.DOM.Attr.OnSubmit where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnSubmit = OnSubmit

instance Attr anything OnSubmit Cb where
  pureAttr OnSubmit value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "submit", value: cb' value }
  mapAttr OnSubmit evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "submit", value: cb' value }

instance Attr anything OnSubmit (Effect Unit) where
  pureAttr OnSubmit value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnSubmit evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "submit", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSubmit (Effect Boolean) where
  pureAttr OnSubmit value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnSubmit evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "submit", value: cb' (Cb (const value)) }

type OnSubmitEffect =
  forall element
   . Attr element OnSubmit (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSubmit Unit where
  pureAttr OnSubmit _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "submit", value: unset' }
  mapAttr OnSubmit evalue = unsafeAttribute $ Right $ evalue <#> \value -> unsafeVolatileAttribute
    { key: "submit", value: unset' }
