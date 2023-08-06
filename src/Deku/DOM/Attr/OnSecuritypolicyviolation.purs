module Deku.DOM.Attr.OnSecuritypolicyviolation where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnSecuritypolicyviolation = OnSecuritypolicyviolation

instance Attr anything OnSecuritypolicyviolation (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnSecuritypolicyviolation bothValues = unsafeAttribute $ Both (pure 
    { key: "securitypolicyviolation", value: cb' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "securitypolicyviolation", value: cb' value }
    )
instance Attr anything OnSecuritypolicyviolation (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnSecuritypolicyviolation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "securitypolicyviolation", value: cb' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "securitypolicyviolation", value: cb' value }
    )
instance Attr anything OnSecuritypolicyviolation  Cb  where
  attr OnSecuritypolicyviolation value = unsafeAttribute $ This $ pure $
    { key: "securitypolicyviolation", value: cb' value }
instance Attr anything OnSecuritypolicyviolation (Event.Event  Cb ) where
  attr OnSecuritypolicyviolation eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "securitypolicyviolation", value: cb' value }

instance Attr anything OnSecuritypolicyviolation (ST.ST Global.Global  Cb ) where
  attr OnSecuritypolicyviolation iValue = unsafeAttribute $ This $
    iValue <#> \value ->
      { key: "securitypolicyviolation", value: cb' value }

instance Attr anything OnSecuritypolicyviolation (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnSecuritypolicyviolation bothValues = unsafeAttribute $ Both (pure 
    { key: "securitypolicyviolation"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "securitypolicyviolation"
        , value: cb' (Cb (const (value $> true)))
        }
    )
instance Attr anything OnSecuritypolicyviolation (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnSecuritypolicyviolation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "securitypolicyviolation"
    , value: cb' (Cb (const ((value) $> true)))
    })
    ( Tuple.snd bothValues <#> \value ->
        { key: "securitypolicyviolation"
        , value: cb' (Cb (const (value $> true)))
        }
    )
instance Attr anything OnSecuritypolicyviolation  (Effect Unit)  where
  attr OnSecuritypolicyviolation value = unsafeAttribute $ This $ pure $
    { key: "securitypolicyviolation", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSecuritypolicyviolation (Event.Event  (Effect Unit) ) where
  attr OnSecuritypolicyviolation eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "securitypolicyviolation"
      , value: cb' (Cb (const (value $> true)))
      }

instance Attr anything OnSecuritypolicyviolation (ST.ST Global.Global  (Effect Unit) ) where
  attr OnSecuritypolicyviolation iValue = unsafeAttribute $ This $
    iValue <#> \value ->
      { key: "securitypolicyviolation"
      , value: cb' (Cb (const (value $> true)))
      }

instance Attr anything OnSecuritypolicyviolation (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnSecuritypolicyviolation bothValues = unsafeAttribute $ Both (pure 
    { key: "securitypolicyviolation", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "securitypolicyviolation", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSecuritypolicyviolation (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnSecuritypolicyviolation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "securitypolicyviolation", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "securitypolicyviolation", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSecuritypolicyviolation  (Effect Boolean)  where
  attr OnSecuritypolicyviolation value = unsafeAttribute $ This $ pure $
    { key: "securitypolicyviolation", value: cb' (Cb (const value)) }
instance Attr anything OnSecuritypolicyviolation (Event.Event  (Effect Boolean) ) where
  attr OnSecuritypolicyviolation eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "securitypolicyviolation", value: cb' (Cb (const value)) }

instance Attr anything OnSecuritypolicyviolation (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnSecuritypolicyviolation iValue = unsafeAttribute $ This $
    iValue <#> \value ->
      { key: "securitypolicyviolation", value: cb' (Cb (const value)) }

instance Attr everything OnSecuritypolicyviolation (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnSecuritypolicyviolation bothValues = unsafeAttribute $ Both (pure 
    { key: "securitypolicyviolation", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "securitypolicyviolation", value: unset' })
instance Attr everything OnSecuritypolicyviolation (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnSecuritypolicyviolation (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "securitypolicyviolation", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "securitypolicyviolation", value: unset' })
instance Attr everything OnSecuritypolicyviolation  Unit  where
  attr OnSecuritypolicyviolation _ = unsafeAttribute $ This $ pure $
    { key: "securitypolicyviolation", value: unset' }
instance Attr everything OnSecuritypolicyviolation (Event.Event  Unit ) where
  attr OnSecuritypolicyviolation eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "securitypolicyviolation", value: unset' }

instance Attr everything OnSecuritypolicyviolation (ST.ST Global.Global  Unit ) where
  attr OnSecuritypolicyviolation iValue = unsafeAttribute $ This $
    iValue <#> \_ -> { key: "securitypolicyviolation", value: unset' }
