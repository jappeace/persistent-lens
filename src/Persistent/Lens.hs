{-# LANGUAGE DerivingStrategies    #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NoImplicitPrelude     #-}
{-# LANGUAGE ScopedTypeVariables   #-}
{-# LANGUAGE TypeFamilies          #-}

-- TODO split out as library (if you read this, tell jappie to do it).
module Persistent.Lens(entityIso, enval, enkey) where

import Control.Lens
import Database.Persist.Types
import Prelude

entityIso :: Iso' (Entity a) (Key a, a)
entityIso = iso (\(Entity a b) -> (a, b)) $ uncurry Entity

enval :: Lens' (Entity a) a
enval = entityIso . _2

enkey :: Lens' (Entity a) (Key a)
enkey = entityIso . _1

