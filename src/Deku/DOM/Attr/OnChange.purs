module Deku.DOM.Attr.OnChange where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnChange = OnChange

instance Attr anything OnChange Cb where
  pureAttr OnChange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "change", value: cb' value }
  mapAttr OnChange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "change", value: cb' value }

instance Attr anything OnChange (Effect Unit) where
  pureAttr OnChange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "change", value: cb' (Cb (const (value $> true))) }
  mapAttr OnChange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "change", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnChange (Effect Boolean) where
  pureAttr OnChange value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "change", value: cb' (Cb (const value)) }
  mapAttr OnChange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "change", value: cb' (Cb (const value)) }

type OnChangeEffect =
  forall element
   . Attr element OnChange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnChange Unit where
  pureAttr OnChange _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "change", value: unset' }
  mapAttr OnChange evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "change", value: unset' }
