module Deku.DOM.Attr.OnTouchend where

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

data OnTouchend = OnTouchend

instance Attr anything OnTouchend (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTouchend bothValues = unsafeAttribute $ Both (pure 
    { key: "touchend", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "touchend", value: cb' value })
instance Attr anything OnTouchend (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnTouchend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "touchend", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "touchend", value: cb' value })
instance Attr anything OnTouchend  Cb  where
  attr OnTouchend value = unsafeAttribute $ This $ pure $
    { key: "touchend", value: cb' value }
instance Attr anything OnTouchend (Event.Event  Cb ) where
  attr OnTouchend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchend", value: cb' value }

instance Attr anything OnTouchend (ST.ST Global.Global  Cb ) where
  attr OnTouchend stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "touchend", value: cb' value }

instance Attr anything OnTouchend (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTouchend bothValues = unsafeAttribute $ Both (pure 
    { key: "touchend", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchend", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTouchend (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnTouchend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "touchend", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "touchend", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTouchend  (Effect Unit)  where
  attr OnTouchend value = unsafeAttribute $ This $ pure $
    { key: "touchend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTouchend (Event.Event  (Effect Unit) ) where
  attr OnTouchend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchend (ST.ST Global.Global  (Effect Unit) ) where
  attr OnTouchend stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "touchend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchend (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTouchend bothValues = unsafeAttribute $ Both (pure 
    { key: "touchend", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchend", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTouchend (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnTouchend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "touchend", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "touchend", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTouchend  (Effect Boolean)  where
  attr OnTouchend value = unsafeAttribute $ This $ pure $
    { key: "touchend", value: cb' (Cb (const value)) }
instance Attr anything OnTouchend (Event.Event  (Effect Boolean) ) where
  attr OnTouchend eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchend", value: cb' (Cb (const value)) }

instance Attr anything OnTouchend (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnTouchend stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "touchend", value: cb' (Cb (const value)) }

instance Attr everything OnTouchend (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTouchend bothValues = unsafeAttribute $ Both (pure 
    { key: "touchend", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "touchend", value: unset' })
instance Attr everything OnTouchend (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnTouchend (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "touchend", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "touchend", value: unset' })
instance Attr everything OnTouchend  Unit  where
  attr OnTouchend _ = unsafeAttribute $ This $ pure $
    { key: "touchend", value: unset' }
instance Attr everything OnTouchend (Event.Event  Unit ) where
  attr OnTouchend eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "touchend", value: unset' }

instance Attr everything OnTouchend (ST.ST Global.Global  Unit ) where
  attr OnTouchend stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "touchend", value: unset' }
