module Deku.DOM.Attr.OnRatechange where

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

data OnRatechange = OnRatechange

instance Attr anything OnRatechange (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnRatechange bothValues = unsafeAttribute $ Both (pure 
    { key: "ratechange", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "ratechange", value: cb' value })
instance Attr anything OnRatechange (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnRatechange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "ratechange", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "ratechange", value: cb' value })
instance Attr anything OnRatechange  Cb  where
  attr OnRatechange value = unsafeAttribute $ This $ pure $
    { key: "ratechange", value: cb' value }
instance Attr anything OnRatechange (Event.Event  Cb ) where
  attr OnRatechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ratechange", value: cb' value }

instance Attr anything OnRatechange (ST.ST Global.Global  Cb ) where
  attr OnRatechange iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "ratechange", value: cb' value }

instance Attr anything OnRatechange (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnRatechange bothValues = unsafeAttribute $ Both (pure 
    { key: "ratechange", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "ratechange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnRatechange (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnRatechange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "ratechange", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "ratechange", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnRatechange  (Effect Unit)  where
  attr OnRatechange value = unsafeAttribute $ This $ pure $
    { key: "ratechange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnRatechange (Event.Event  (Effect Unit) ) where
  attr OnRatechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ratechange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnRatechange (ST.ST Global.Global  (Effect Unit) ) where
  attr OnRatechange iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "ratechange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnRatechange (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnRatechange bothValues = unsafeAttribute $ Both (pure 
    { key: "ratechange", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "ratechange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnRatechange (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnRatechange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "ratechange", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "ratechange", value: cb' (Cb (const value)) }
    )
instance Attr anything OnRatechange  (Effect Boolean)  where
  attr OnRatechange value = unsafeAttribute $ This $ pure $
    { key: "ratechange", value: cb' (Cb (const value)) }
instance Attr anything OnRatechange (Event.Event  (Effect Boolean) ) where
  attr OnRatechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "ratechange", value: cb' (Cb (const value)) }

instance Attr anything OnRatechange (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnRatechange iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "ratechange", value: cb' (Cb (const value)) }

instance Attr everything OnRatechange (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnRatechange bothValues = unsafeAttribute $ Both (pure 
    { key: "ratechange", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "ratechange", value: unset' })
instance Attr everything OnRatechange (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnRatechange (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "ratechange", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "ratechange", value: unset' })
instance Attr everything OnRatechange  Unit  where
  attr OnRatechange _ = unsafeAttribute $ This $ pure $
    { key: "ratechange", value: unset' }
instance Attr everything OnRatechange (Event.Event  Unit ) where
  attr OnRatechange eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "ratechange", value: unset' }

instance Attr everything OnRatechange (ST.ST Global.Global  Unit ) where
  attr OnRatechange iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "ratechange", value: unset' }
