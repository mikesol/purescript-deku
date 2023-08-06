module Deku.DOM.Attr.OnSecuritypolicyviolation where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnSecuritypolicyviolation = OnSecuritypolicyviolation

instance Attr anything OnSecuritypolicyviolation  Cb  where
  attr OnSecuritypolicyviolation value = unsafeAttribute $ Left $  
    { key: "securitypolicyviolation", value: cb' value }
instance Attr anything OnSecuritypolicyviolation (Event.Event  Cb ) where
  attr OnSecuritypolicyviolation eventValue = unsafeAttribute $ Right $
    eventValue <#> \value ->
      { key: "securitypolicyviolation", value: cb' value }


instance Attr anything OnSecuritypolicyviolation  (Effect Unit)  where
  attr OnSecuritypolicyviolation value = unsafeAttribute $ Left $  
    { key: "securitypolicyviolation", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSecuritypolicyviolation (Event.Event  (Effect Unit) ) where
  attr OnSecuritypolicyviolation eventValue = unsafeAttribute $ Right $
    eventValue <#> \value ->
      { key: "securitypolicyviolation"
      , value: cb' (Cb (const (value $> true)))
      }


instance Attr anything OnSecuritypolicyviolation  (Effect Boolean)  where
  attr OnSecuritypolicyviolation value = unsafeAttribute $ Left $  
    { key: "securitypolicyviolation", value: cb' (Cb (const value)) }
instance Attr anything OnSecuritypolicyviolation (Event.Event  (Effect Boolean) ) where
  attr OnSecuritypolicyviolation eventValue = unsafeAttribute $ Right $
    eventValue <#> \value ->
      { key: "securitypolicyviolation", value: cb' (Cb (const value)) }


instance Attr everything OnSecuritypolicyviolation  Unit  where
  attr OnSecuritypolicyviolation _ = unsafeAttribute $ Left $  
    { key: "securitypolicyviolation", value: unset' }
instance Attr everything OnSecuritypolicyviolation (Event.Event  Unit ) where
  attr OnSecuritypolicyviolation eventValue = unsafeAttribute $ Right $
    eventValue <#> \_ -> { key: "securitypolicyviolation", value: unset' }
