module Deku.DOM.Attr.OnKeyup where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnKeyup = OnKeyup

instance Attr anything OnKeyup Cb where
  pureAttr OnKeyup value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "keyup", value: cb' value }
  mapAttr OnKeyup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keyup", value: cb' value }

instance Attr anything OnKeyup (Effect Unit) where
  pureAttr OnKeyup value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "keyup", value: cb' (Cb (const (value $> true))) }
  mapAttr OnKeyup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "keyup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeyup (Effect Boolean) where
  pureAttr OnKeyup value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "keyup", value: cb' (Cb (const value)) }
  mapAttr OnKeyup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "keyup", value: cb' (Cb (const value)) }

type OnKeyupEffect =
  forall element
   . Attr element OnKeyup (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnKeyup Unit where
  pureAttr OnKeyup _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "keyup", value: unset' }
  mapAttr OnKeyup evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "keyup", value: unset' }
