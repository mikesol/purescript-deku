module Deku.DOM.Attr.OnLostpointercapture where

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

data OnLostpointercapture = OnLostpointercapture

instance Attr anything OnLostpointercapture (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnLostpointercapture bothValues = unsafeAttribute $ Both (pure 
    { key: "lostpointercapture", value: cb' (NonEmpty.head bothValues) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "lostpointercapture", value: cb' value }
    )
instance Attr anything OnLostpointercapture (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnLostpointercapture (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "lostpointercapture", value: cb' (value) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "lostpointercapture", value: cb' value }
    )
instance Attr anything OnLostpointercapture  Cb  where
  attr OnLostpointercapture value = unsafeAttribute $ This $ pure $
    { key: "lostpointercapture", value: cb' value }
instance Attr anything OnLostpointercapture (Event.Event  Cb ) where
  attr OnLostpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value -> { key: "lostpointercapture", value: cb' value }

instance Attr anything OnLostpointercapture (ST.ST Global.Global  Cb ) where
  attr OnLostpointercapture stValue = unsafeAttribute $ This $
    stValue <#> \value -> { key: "lostpointercapture", value: cb' value }

instance Attr anything OnLostpointercapture (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnLostpointercapture bothValues = unsafeAttribute $ Both (pure 
    { key: "lostpointercapture"
    , value: cb' (Cb (const ((NonEmpty.head bothValues) $> true)))
    })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLostpointercapture (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnLostpointercapture (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "lostpointercapture"
    , value: cb' (Cb (const ((value) $> true)))
    })
    ( Tuple.snd bothValues <#> \value ->
        { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnLostpointercapture  (Effect Unit)  where
  attr OnLostpointercapture value = unsafeAttribute $ This $ pure $
    { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLostpointercapture (Event.Event  (Effect Unit) ) where
  attr OnLostpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLostpointercapture (ST.ST Global.Global  (Effect Unit) ) where
  attr OnLostpointercapture stValue = unsafeAttribute $ This $
    stValue <#> \value ->
      { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLostpointercapture (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnLostpointercapture bothValues = unsafeAttribute $ Both (pure 
    { key: "lostpointercapture", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "lostpointercapture", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLostpointercapture (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnLostpointercapture (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "lostpointercapture", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "lostpointercapture", value: cb' (Cb (const value)) }
    )
instance Attr anything OnLostpointercapture  (Effect Boolean)  where
  attr OnLostpointercapture value = unsafeAttribute $ This $ pure $
    { key: "lostpointercapture", value: cb' (Cb (const value)) }
instance Attr anything OnLostpointercapture (Event.Event  (Effect Boolean) ) where
  attr OnLostpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \value ->
      { key: "lostpointercapture", value: cb' (Cb (const value)) }

instance Attr anything OnLostpointercapture (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnLostpointercapture stValue = unsafeAttribute $ This $
    stValue <#> \value ->
      { key: "lostpointercapture", value: cb' (Cb (const value)) }

instance Attr everything OnLostpointercapture (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnLostpointercapture bothValues = unsafeAttribute $ Both (pure 
    { key: "lostpointercapture", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "lostpointercapture", value: unset' })
instance Attr everything OnLostpointercapture (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnLostpointercapture (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "lostpointercapture", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "lostpointercapture", value: unset' })
instance Attr everything OnLostpointercapture  Unit  where
  attr OnLostpointercapture _ = unsafeAttribute $ This $ pure $
    { key: "lostpointercapture", value: unset' }
instance Attr everything OnLostpointercapture (Event.Event  Unit ) where
  attr OnLostpointercapture eventValue = unsafeAttribute $ That $
    eventValue <#> \_ -> { key: "lostpointercapture", value: unset' }

instance Attr everything OnLostpointercapture (ST.ST Global.Global  Unit ) where
  attr OnLostpointercapture stValue = unsafeAttribute $ This $
    stValue <#> \_ -> { key: "lostpointercapture", value: unset' }
