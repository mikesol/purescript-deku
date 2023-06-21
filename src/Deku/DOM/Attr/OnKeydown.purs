module Deku.DOM.Attr.OnKeydown where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnKeydown = OnKeydown

instance Attr anything OnKeydown Cb where
  pureAttr OnKeydown value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "keydown", value: cb' value }
  mapAttr OnKeydown evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "keydown", value: cb' value }

instance Attr anything OnKeydown (Effect Unit) where
  pureAttr OnKeydown value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnKeydown evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "keydown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeydown (Effect Boolean) where
  pureAttr OnKeydown value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnKeydown evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "keydown", value: cb' (Cb (const value)) }

type OnKeydownEffect =
  forall element
   . Attr element OnKeydown (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnKeydown Unit where
  pureAttr OnKeydown _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "keydown", value: unset' }
