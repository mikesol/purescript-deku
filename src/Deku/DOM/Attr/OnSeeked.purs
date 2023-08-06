module Deku.DOM.Attr.OnSeeked where

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

data OnSeeked = OnSeeked

instance Attr anything OnSeeked (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnSeeked bothValues = unsafeAttribute $ Both (pure 
    { key: "seeked", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "seeked", value: cb' value })
instance Attr anything OnSeeked (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnSeeked (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "seeked", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "seeked", value: cb' value })
instance Attr anything OnSeeked  Cb  where
  attr OnSeeked value = unsafeAttribute $ This $ pure $
    { key: "seeked", value: cb' value }
instance Attr anything OnSeeked (Event.Event  Cb ) where
  attr OnSeeked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "seeked", value: cb' value }

instance Attr anything OnSeeked (ST.ST Global.Global  Cb ) where
  attr OnSeeked iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "seeked", value: cb' value }

instance Attr anything OnSeeked (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnSeeked bothValues = unsafeAttribute $ Both (pure 
    { key: "seeked", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "seeked", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSeeked (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnSeeked (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "seeked", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "seeked", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSeeked  (Effect Unit)  where
  attr OnSeeked value = unsafeAttribute $ This $ pure $
    { key: "seeked", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSeeked (Event.Event  (Effect Unit) ) where
  attr OnSeeked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "seeked", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSeeked (ST.ST Global.Global  (Effect Unit) ) where
  attr OnSeeked iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "seeked", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSeeked (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnSeeked bothValues = unsafeAttribute $ Both (pure 
    { key: "seeked", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "seeked", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSeeked (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnSeeked (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "seeked", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "seeked", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSeeked  (Effect Boolean)  where
  attr OnSeeked value = unsafeAttribute $ This $ pure $
    { key: "seeked", value: cb' (Cb (const value)) }
instance Attr anything OnSeeked (Event.Event  (Effect Boolean) ) where
  attr OnSeeked eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "seeked", value: cb' (Cb (const value)) }

instance Attr anything OnSeeked (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnSeeked iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "seeked", value: cb' (Cb (const value)) }

instance Attr everything OnSeeked (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnSeeked bothValues = unsafeAttribute $ Both (pure 
    { key: "seeked", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "seeked", value: unset' })
instance Attr everything OnSeeked (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnSeeked (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "seeked", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "seeked", value: unset' })
instance Attr everything OnSeeked  Unit  where
  attr OnSeeked _ = unsafeAttribute $ This $ { key: "seeked", value: unset' }
instance Attr everything OnSeeked (Event.Event  Unit ) where
  attr OnSeeked eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "seeked", value: unset' }

instance Attr everything OnSeeked (ST.ST Global.Global  Unit ) where
  attr OnSeeked iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "seeked", value: unset' }
