module Deku.DOM.Attr.OnEmptied where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnEmptied = OnEmptied

instance Attr anything OnEmptied Cb where
  pureAttr OnEmptied value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "emptied", value: cb' value }
  mapAttr OnEmptied evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "emptied", value: cb' value }

instance Attr anything OnEmptied (Effect Unit) where
  pureAttr OnEmptied value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnEmptied evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "emptied", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnEmptied (Effect Boolean) where
  pureAttr OnEmptied value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
  mapAttr OnEmptied evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "emptied", value: cb' (Cb (const value)) }

type OnEmptiedEffect =
  forall element
   . Attr element OnEmptied (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnEmptied Unit where
  pureAttr OnEmptied _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "emptied", value: unset' }
