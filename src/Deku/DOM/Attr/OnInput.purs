module Deku.DOM.Attr.OnInput where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnInput = OnInput

instance Attr anything OnInput Cb where
  pureAttr OnInput value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "input", value: cb' value }
  mapAttr OnInput evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "input", value: cb' value }

instance Attr anything OnInput (Effect Unit) where
  pureAttr OnInput value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnInput evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "input", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnInput (Effect Boolean) where
  pureAttr OnInput value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnInput evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "input", value: cb' (Cb (const value)) }

type OnInputEffect =
  forall element
   . Attr element OnInput (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnInput Unit where
  pureAttr OnInput _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "input", value: unset' }
  mapAttr OnInput evalue = unsafeAttribute $ Right $ evalue <#> \value -> unsafeVolatileAttribute
    { key: "input", value: unset' }
