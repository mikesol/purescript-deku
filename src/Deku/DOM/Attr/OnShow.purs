module Deku.DOM.Attr.OnShow where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnShow = OnShow

instance Attr anything OnShow Cb where
  pureAttr OnShow value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute { key: "show ", value: cb' value }
  mapAttr OnShow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "show ", value: cb' value }

instance Attr anything OnShow (Effect Unit) where
  pureAttr OnShow value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "show ", value: cb' (Cb (const (value $> true))) }
  mapAttr OnShow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "show ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnShow (Effect Boolean) where
  pureAttr OnShow value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "show ", value: cb' (Cb (const value)) }
  mapAttr OnShow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "show ", value: cb' (Cb (const value)) }

type OnShowEffect =
  forall element. Attr element OnShow (Effect Unit) => Event (Attribute element)

instance Attr everything OnShow Unit where
  pureAttr OnShow _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "show ", value: unset' }
  mapAttr OnShow evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "show ", value: unset' }
