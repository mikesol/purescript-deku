module Deku.DOM.Attr.OnTouchmove where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnTouchmove = OnTouchmove

instance Attr anything OnTouchmove Cb where
  pureAttr OnTouchmove value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnTouchmove evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "touchmove", value: cb' value }

instance Attr anything OnTouchmove (Effect Unit) where
  pureAttr OnTouchmove value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnTouchmove evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "touchmove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchmove (Effect Boolean) where
  pureAttr OnTouchmove value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnTouchmove evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "touchmove", value: cb' (Cb (const value)) }

type OnTouchmoveEffect =
  forall element
   . Attr element OnTouchmove (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnTouchmove Unit where
  pureAttr OnTouchmove _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "touchmove", value: unset' }
