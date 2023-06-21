module Deku.DOM.Attr.OnAuxclick where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnAuxclick = OnAuxclick

instance Attr anything OnAuxclick Cb where
  pureAttr OnAuxclick value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "auxclick ", value: cb' value }
  mapAttr OnAuxclick evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "auxclick ", value: cb' value }

instance Attr anything OnAuxclick (Effect Unit) where
  pureAttr OnAuxclick value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnAuxclick evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "auxclick ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAuxclick (Effect Boolean) where
  pureAttr OnAuxclick value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnAuxclick evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "auxclick ", value: cb' (Cb (const value)) }

type OnAuxclickEffect =
  forall element
   . Attr element OnAuxclick (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAuxclick Unit where
  pureAttr OnAuxclick _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "auxclick ", value: unset' }
