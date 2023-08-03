module Deku.DOM.Attr.OnGotpointercapture where

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

data OnGotpointercapture = OnGotpointercapture

instance Attr anything OnGotpointercapture (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnGotpointercapture bothValues = unsafeAttribute $ Both (pure 
    { key: "gotpointercapture", value: cb' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "gotpointercapture", value: cb' value }
    )
instance Attr anything OnGotpointercapture (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnGotpointercapture (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "gotpointercapture", value: cb' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "gotpointercapture", value: cb' value }
    )
instance Attr anything OnGotpointercapture  Cb  where
  attr OnGotpointercapture value = unsafeAttribute $ This $ pure $
    { key: "gotpointercapture", value: cb' value }
instance Attr anything OnGotpointercapture (Event.Event  Cb ) where
  attr OnGotpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "gotpointercapture", value: cb' value }

instance Attr anything OnGotpointercapture (ST.ST Global.Global  Cb ) where
  attr OnGotpointercapture stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "gotpointercapture", value: cb' value }

instance Attr anything OnGotpointercapture (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnGotpointercapture bothValues = unsafeAttribute $ Both (pure 
    { key: "gotpointercapture"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnGotpointercapture (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnGotpointercapture (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "gotpointercapture"
    , value: cb' (Cb (const ((value) $> true)))
    })
    ( Tuple.snd bothValues <#> \value ->
        { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnGotpointercapture  (Effect Unit)  where
  attr OnGotpointercapture value = unsafeAttribute $ This $ pure $
    { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnGotpointercapture (Event.Event  (Effect Unit) ) where
  attr OnGotpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnGotpointercapture (ST.ST Global.Global  (Effect Unit) ) where
  attr OnGotpointercapture stValue = unsafeAttribute $ This $
    stValue <#> \value ->
      { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnGotpointercapture (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnGotpointercapture bothValues = unsafeAttribute $ Both (pure 
    { key: "gotpointercapture", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "gotpointercapture", value: cb' (Cb (const value)) }
    )
instance Attr anything OnGotpointercapture (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnGotpointercapture (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "gotpointercapture", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "gotpointercapture", value: cb' (Cb (const value)) }
    )
instance Attr anything OnGotpointercapture  (Effect Boolean)  where
  attr OnGotpointercapture value = unsafeAttribute $ This $ pure $
    { key: "gotpointercapture", value: cb' (Cb (const value)) }
instance Attr anything OnGotpointercapture (Event.Event  (Effect Boolean) ) where
  attr OnGotpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "gotpointercapture", value: cb' (Cb (const value)) }

instance Attr anything OnGotpointercapture (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnGotpointercapture stValue = unsafeAttribute $ This $
    stValue <#> \value ->
      { key: "gotpointercapture", value: cb' (Cb (const value)) }

instance Attr everything OnGotpointercapture (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnGotpointercapture bothValues = unsafeAttribute $ Both (pure 
    { key: "gotpointercapture", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "gotpointercapture", value: unset' })
instance Attr everything OnGotpointercapture (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnGotpointercapture (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "gotpointercapture", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "gotpointercapture", value: unset' })
instance Attr everything OnGotpointercapture  Unit  where
  attr OnGotpointercapture _ = unsafeAttribute $ This $ pure $
    { key: "gotpointercapture", value: unset' }
instance Attr everything OnGotpointercapture (Event.Event  Unit ) where
  attr OnGotpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "gotpointercapture", value: unset' }

instance Attr everything OnGotpointercapture (ST.ST Global.Global  Unit ) where
  attr OnGotpointercapture stValue = unsafeAttribute $ This $
    stValue <#> \_ -> { key: "gotpointercapture", value: unset' }
