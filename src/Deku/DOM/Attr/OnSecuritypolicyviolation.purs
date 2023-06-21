module Deku.DOM.Attr.OnSecuritypolicyviolation where

import Prelude
import Data.Either (Either(..))
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags
import FRP.Event (Event)

data OnSecuritypolicyviolation = OnSecuritypolicyviolation

instance Attr anything OnSecuritypolicyviolation Cb where
  pureAttr OnSecuritypolicyviolation value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "securitypolicyviolation", value: cb' value }
  mapAttr OnSecuritypolicyviolation evalue = unsafeAttribute $ Right $ evalue
    <#> \value ->
      unsafeVolatileAttribute
        { key: "securitypolicyviolation", value: cb' value }

instance Attr anything OnSecuritypolicyviolation (Effect Unit) where
  pureAttr OnSecuritypolicyviolation value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "securitypolicyviolation"
      , value: cb' (Cb (const (value $> true)))
      }
  mapAttr OnSecuritypolicyviolation evalue = unsafeAttribute $ Right $ evalue
    <#> \value ->
      unsafeVolatileAttribute
        { key: "securitypolicyviolation"
        , value: cb' (Cb (const (value $> true)))
        }

instance Attr anything OnSecuritypolicyviolation (Effect Boolean) where
  pureAttr OnSecuritypolicyviolation value = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "securitypolicyviolation", value: cb' (Cb (const value)) }
  mapAttr OnSecuritypolicyviolation evalue = unsafeAttribute $ Right $ evalue
    <#> \value ->
      unsafeVolatileAttribute
        { key: "securitypolicyviolation", value: cb' (Cb (const value)) }

type OnSecuritypolicyviolationEffect =
  forall element
   . Attr element OnSecuritypolicyviolation (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSecuritypolicyviolation Unit where
  pureAttr OnSecuritypolicyviolation _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "securitypolicyviolation", value: unset' }

  mapAttr OnSecuritypolicyviolation evalue = unsafeAttribute $ Right $ evalue
    <#> \_ ->
      unsafeVolatileAttribute
        { key: "securitypolicyviolation", value: unset' }