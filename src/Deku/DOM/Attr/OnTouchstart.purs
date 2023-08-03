module Deku.DOM.Attr.OnTouchstart where

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

data OnTouchstart = OnTouchstart

instance Attr anything OnTouchstart (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnTouchstart bothValues = unsafeAttribute $ Both (pure 
    { key: "touchstart", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "touchstart", value: cb' value })
instance Attr anything OnTouchstart (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnTouchstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "touchstart", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "touchstart", value: cb' value })
instance Attr anything OnTouchstart  Cb  where
  attr OnTouchstart value = unsafeAttribute $ This $ pure $
    { key: "touchstart", value: cb' value }
instance Attr anything OnTouchstart (Event.Event  Cb ) where
  attr OnTouchstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchstart", value: cb' value }

instance Attr anything OnTouchstart (ST.ST Global.Global  Cb ) where
  attr OnTouchstart stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "touchstart", value: cb' value }

instance Attr anything OnTouchstart (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnTouchstart bothValues = unsafeAttribute $ Both (pure 
    { key: "touchstart", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchstart", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTouchstart (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnTouchstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "touchstart", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "touchstart", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnTouchstart  (Effect Unit)  where
  attr OnTouchstart value = unsafeAttribute $ This $ pure $
    { key: "touchstart", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTouchstart (Event.Event  (Effect Unit) ) where
  attr OnTouchstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchstart (ST.ST Global.Global  (Effect Unit) ) where
  attr OnTouchstart stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "touchstart", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnTouchstart (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnTouchstart bothValues = unsafeAttribute $ Both (pure 
    { key: "touchstart", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "touchstart", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTouchstart (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnTouchstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "touchstart", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "touchstart", value: cb' (Cb (const value)) }
    )
instance Attr anything OnTouchstart  (Effect Boolean)  where
  attr OnTouchstart value = unsafeAttribute $ This $ pure $
    { key: "touchstart", value: cb' (Cb (const value)) }
instance Attr anything OnTouchstart (Event.Event  (Effect Boolean) ) where
  attr OnTouchstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "touchstart", value: cb' (Cb (const value)) }

instance Attr anything OnTouchstart (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnTouchstart stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "touchstart", value: cb' (Cb (const value)) }

instance Attr everything OnTouchstart (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnTouchstart bothValues = unsafeAttribute $ Both (pure 
    { key: "touchstart", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "touchstart", value: unset' })
instance Attr everything OnTouchstart (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnTouchstart (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "touchstart", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "touchstart", value: unset' })
instance Attr everything OnTouchstart  Unit  where
  attr OnTouchstart _ = unsafeAttribute $ This $ pure $
    { key: "touchstart", value: unset' }
instance Attr everything OnTouchstart (Event.Event  Unit ) where
  attr OnTouchstart eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "touchstart", value: unset' }

instance Attr everything OnTouchstart (ST.ST Global.Global  Unit ) where
  attr OnTouchstart stValue = unsafeAttribute $ This $ stValue <#>
    \_ -> { key: "touchstart", value: unset' }
