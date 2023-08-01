module Deku.DOM.Attr.OnSecuritypolicyviolation where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSecuritypolicyviolation = OnSecuritypolicyviolation

instance Attr anything OnSecuritypolicyviolation Cb where
  attr OnSecuritypolicyviolation bothValues = unsafeAttribute $ Both
    { key: "securitypolicyviolation", value: cb' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "securitypolicyviolation", value: cb' value }
    )
  pureAttr OnSecuritypolicyviolation value = unsafeAttribute $ This
    { key: "securitypolicyviolation", value: cb' value }
  unpureAttr OnSecuritypolicyviolation eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "securitypolicyviolation", value: cb' value }

instance Attr anything OnSecuritypolicyviolation (Effect Unit) where
  attr OnSecuritypolicyviolation bothValues = unsafeAttribute $ Both
    { key: "securitypolicyviolation"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "securitypolicyviolation"
        , value: cb' (Cb (const (value $> true)))
        }
    )
  pureAttr OnSecuritypolicyviolation value = unsafeAttribute $ This
    { key: "securitypolicyviolation", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnSecuritypolicyviolation eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "securitypolicyviolation"
      , value: cb' (Cb (const (value $> true)))
      }

instance Attr anything OnSecuritypolicyviolation (Effect Boolean) where
  attr OnSecuritypolicyviolation bothValues = unsafeAttribute $ Both
    { key: "securitypolicyviolation", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "securitypolicyviolation", value: cb' (Cb (const value)) }
    )
  pureAttr OnSecuritypolicyviolation value = unsafeAttribute $ This
    { key: "securitypolicyviolation", value: cb' (Cb (const value)) }
  unpureAttr OnSecuritypolicyviolation eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "securitypolicyviolation", value: cb' (Cb (const value)) }

type OnSecuritypolicyviolationEffect =
  forall element
   . Attr element OnSecuritypolicyviolation (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSecuritypolicyviolation Unit where
  attr OnSecuritypolicyviolation bothValues = unsafeAttribute $ Both
    { key: "securitypolicyviolation", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "securitypolicyviolation", value: unset' })
  pureAttr OnSecuritypolicyviolation _ = unsafeAttribute $ This
    { key: "securitypolicyviolation", value: unset' }
  unpureAttr OnSecuritypolicyviolation eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "securitypolicyviolation", value: unset' }
