/*
 * ppk_usb
 *
 * Copyright (C) 2014 cy384
 * All rights reserved.
 *
 * This software may be modified and distributed under the terms
 * of the BSD license. See the LICENSE file for details.
 */

// 3d printable adapter for palm-V era devices

module pin()
{
	translate([-1.95/2, -0.8, 0])
	{
		cube(size = [1.95, 1.20, 10.00], center = false);
	}

	translate([(-1.95/2)-0.4, -2.4, 0])
	{
		cube(size = [0.80, 7.60, 10.00], center = false);
	}

	translate([(+1.95/2)-0.4, -2.4, 0])
	{
		cube(size = [0.80, 7.60, 10.00], center = false);
	}
}

module hole()
{
	translate([0, 5.00, 10.00])
	{
		cube(size = [1.15, 5.00, 3.00], center = true);
	}

	translate([0, 5.00, 0.00])
	{
		cube(size = [1.15, 5.00, 3.00], center = true);
	}
}

module palm_v_adapter()
{
	difference()
	{
		union()
		{
			// space for each pin
			for (i = [0 : 4])
			{
				translate([-((1.95/2)+(1.95*i)), 3.5, 0]) pin();
				translate([(1.95/2)+(1.95*i), 3.5, 0]) pin();
			}

			// ears
			translate ([12.65, 1.90, 7]) cube ([5.0, 1.6, 6], center = true);
			translate ([-12.65, 1.90, 7]) cube ([5.0, 1.6, 6], center = true);
		}

		// make holes for the contacts
		for (i = [0 : 4])
		{
			translate([-((1.95/2)+(1.95*i)), 0, 0]) hole();
			translate([(1.95/2)+(1.95*i), 0, 0]) hole();
		}
	}
}

palm_v_adapter();
