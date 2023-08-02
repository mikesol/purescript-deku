module Deku.DOM.Attr.OnSecuritypolicyviolation where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnSecuritypolicyviolation = OnSecuritypolicyviolation

instance Attr anything OnSecuritypolicyviolation (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnSecuritypolicyviolation bothValues = unsafeAttribute $ Both
    { key: "securitypolicyviolation", value: cb' (NonEmpty.head bothValues) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "securitypolicyviolation", value: cb' value }
    )
instance Attr anything OnSecuritypolicyviolation  Cb  where
  attr OnSecuritypolicyviolation value = unsafeAttribute $ This
    { key: "securitypolicyviolation", value: cb' value }
instance Attr anything OnSecuritypolicyviolation (Event.Event  Cb ) where
  attr OnSecuritypolicyviolation eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "securitypolicyviolation", value: cb' value }

instance Attr anything OnSecuritypolicyviolation (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnSecuritypolicyviolation bothValues = unsafeAttribute $ Both
    { key: "securitypolicyviolation"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "securitypolicyviolation"
        , value: cb' (Cb (const (value $> true)))
        }
    )
instance Attr anything OnSecuritypolicyviolation  (Effect Unit)  where
  attr OnSecuritypolicyviolation value = unsafeAttribute $ This
    { key: "securitypolicyviolation", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSecuritypolicyviolation (Event.Event  (Effect Unit) ) where
  attr OnSecuritypolicyviolation eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "securitypolicyviolation"
      , value: cb' (Cb (const (value $> true)))
      }

instance Attr anything OnSecuritypolicyviolation (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnSecuritypolicyviolation bothValues = unsafeAttribute $ Both
    { key: "securitypolicyviolation", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "securitypolicyviolation", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSecuritypolicyviolation  (Effect Boolean)  where
  attr OnSecuritypolicyviolation value = unsafeAttribute $ This
    { key: "securitypolicyviolation", value: cb' (Cb (const value)) }
instance Attr anything OnSecuritypolicyviolation (Event.Event  (Effect Boolean) ) where
  attr OnSecuritypolicyviolation eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "securitypolicyviolation", value: cb' (Cb (const value)) }

type OnSecuritypolicyviolationEffect =
  forall element
   . Attr element OnSecuritypolicyviolation (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnSecuritypolicyviolation (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnSecuritypolicyviolation bothValues = unsafeAttribute $ Both
    { key: "securitypolicyviolation", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "securitypolicyviolation", value: unset' })
instance Attr everything OnSecuritypolicyviolation  Unit  where
  attr OnSecuritypolicyviolation _ = unsafeAttribute $ This
    { key: "securitypolicyviolation", value: unset' }
instance Attr everything OnSecuritypolicyviolation (Event.Event  Unit ) where
  attr OnSecuritypolicyviolation eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "securitypolicyviolation", value: unset' }
