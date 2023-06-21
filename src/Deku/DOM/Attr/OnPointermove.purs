module Deku.DOM.Attr.OnPointermove where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnPointermove = OnPointermove

instance Attr anything OnPointermove Cb where
  pureAttr OnPointermove value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointermove", value: cb' value }
  mapAttr OnPointermove evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointermove", value: cb' value }

instance Attr anything OnPointermove (Effect Unit) where
  pureAttr OnPointermove value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointermove", value: cb' (Cb (const (value $> true))) }
  mapAttr OnPointermove evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointermove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointermove (Effect Boolean) where
  pureAttr OnPointermove value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointermove", value: cb' (Cb (const value)) }
  mapAttr OnPointermove evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointermove", value: cb' (Cb (const value)) }

type OnPointermoveEffect =
  forall element
   . Attr element OnPointermove (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointermove Unit where
  pureAttr OnPointermove _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointermove", value: unset' }

  mapAttr OnPointermove evalue = unsafeAttribute $ Right $ evalue <#> \_ ->
    unsafeVolatileAttribute
      { key: "pointermove", value: unset' }